// NOTE: Currently it still contains a lot of duplicates (because it was
// migrated from manual code). But when adding more tests, we can refactor and avoid it.
String generateBenchmark() {
  final chunks = [
    ..._benchmarkVoidFunction(),
    ..._benchmarkBytes(),
    ..._benchmarkBinaryTree(),
    ..._benchmarkBlob(),
  ];

  return '''
// ignore_for_file: invalid_use_of_internal_member, invalid_use_of_protected_member

import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:frb_example_pure_dart/src/rust/api/pseudo_manual/benchmark_api.dart';
import 'package:frb_example_pure_dart/src/rust/api/pseudo_manual/benchmark_api_twin_sync.dart';
import 'package:frb_example_pure_dart/src/rust/api/pseudo_manual/benchmark_api_twin_sync_sse.dart';
import 'package:frb_example_pure_dart/src/rust/frb_generated.dart';
import 'package:frb_example_pure_dart/src/rust/frb_generated.io.dart';

import 'benchmark_utils.dart';
import 'protobuf_for_benchmark/protobuf_for_benchmark.pb.dart';

${chunks.join("\n")}
  ''';
}

class _TypedName {
  final String type;
  final String name;

  const _TypedName(this.type, this.name);
}

String _generate({
  required String stem,
  required bool asynchronous,
  String setupDataType = 'Null',
  List<_TypedName> args = const [],
  String setup = '',
  required String run,
}) {
  final benchName =
      '${stem}_${asynchronous ? "Async" : "Sync"}${args.map((arg) => "_${arg.name}\$${arg.name}").join("")}';

  final functionSetup = asynchronous
      ? 'Future<void> setup() async { $setup }'
      : 'void setup() { $setup }';

  final functionRun = asynchronous
      ? 'Future<void> run() async { $run }'
      : 'void run() { $run }';

  return '''
class ${benchName}Benchmark extends Enhanced${asynchronous ? "Async" : "Sync"}BenchmarkBase {
  late final $setupDataType setupData;
  ${args.map((arg) => 'final ${arg.type} ${arg.name};\n').join('')}
  
  const ${benchName}Benchmark({
    ${args.map((arg) => 'required this.${arg.name},\n').join('')}
    super.emitter,
  }) : super('$benchName');
  
  @override
  $functionSetup

  @override
  $functionRun
}
  ''';
}

List<String> _benchmarkVoidFunction() {
  return [
    _generate(
      stem: 'Void',
      asynchronous: true,
      run: 'benchmarkVoidTwinNormal();',
    ),
    _generate(
      stem: 'Void',
      asynchronous: false,
      run: 'benchmarkVoidTwinSync();',
    ),
    _generate(
      stem: 'VoidRaw',
      asynchronous: false,
      run: 'rawWire.benchmark_raw_void_sync();',
    ),
    // For example:
    // https://github.com/isar/isar/blob/95e1f02c274bb4bb80f98c1a42ddf33f3690a50c/packages/isar/lib/src/impl/isar_impl.dart#L351
    _generate(
      stem: 'VoidRawByIsolate',
      asynchronous: false,
      run: '''
        await Isolate.run(() async {
          // This library loading may not be optimal, just a rough test
          final wire = RustLibWire.fromExternalLibrary(await loadExternalLibrary(
              RustLib.kDefaultExternalLibraryLoaderConfig));
          wire.benchmark_raw_void_sync();
        });
      ''',
    ),
  ];
}

List<String> _benchmarkBytes() {
  return [
    _generate(
      stem: 'InputBytes',
      asynchronous: true,
      args: const [_TypedName('int', 'len')],
      setupDataType: 'Uint8List',
      setup: 'setupData = Uint8List(len);',
      run: 'benchmarkInputBytesTwinNormal(bytes: setupData);',
    ),
  ];

  return '''
class InputBytesAsyncBenchmark extends EnhancedAsyncBenchmarkBase {
  final Uint8List bytes;

  InputBytesAsyncBenchmark(int len, {super.emitter})
      : bytes = Uint8List(len),
        super('InputBytesAsync_Len\$len');
}

class InputBytesSyncBenchmark extends EnhancedBenchmarkBase {
  final Uint8List bytes;

  InputBytesSyncBenchmark(int len, {super.emitter})
      : bytes = Uint8List(len),
        super('InputBytesSync_Len\$len');

  @override
  void run() => benchmarkInputBytesTwinSync(bytes: bytes);
}

class InputBytesSyncRawBenchmark extends EnhancedBenchmarkBase {
  final Uint8List bytes;

  InputBytesSyncRawBenchmark(int len, {super.emitter})
      : bytes = Uint8List(len),
        super('InputBytesSyncRaw_Len\$len');

  @override
  void run() {
    final raw = rawWire.benchmark_raw_new_list_prim_u_8(bytes.length);
    raw.ptr.asTypedList(raw.len).setAll(0, bytes);
    final ans = rawWire.benchmark_raw_input_bytes(raw);
    if (ans != 0) throw Exception();
  }
}

class OutputBytesAsyncBenchmark extends EnhancedAsyncBenchmarkBase {
  final int len;

  OutputBytesAsyncBenchmark(this.len, {super.emitter})
      : super('OutputBytesAsync_Len\$len');

  @override
  Future<void> run() async => benchmarkOutputBytesTwinNormal(size: len);
}

class OutputBytesSyncBenchmark extends EnhancedBenchmarkBase {
  final int len;

  OutputBytesSyncBenchmark(this.len, {super.emitter})
      : super('OutputBytesSync_Len\$len');

  @override
  void run() => benchmarkOutputBytesTwinSync(size: len);
}

class OutputBytesAsyncRawBenchmark extends EnhancedAsyncBenchmarkBase {
  final receivePort = RawReceivePort();
  late final sendPort = receivePort.sendPort.nativePort;
  final int len;
  final completers = <int, Completer<Uint8List>>{};
  var nextId = 1;

  OutputBytesAsyncRawBenchmark(this.len, {super.emitter})
      : super('OutputBytesAsyncRaw_Len\$len') {
    receivePort.handler = (dynamic response) {
      final bytes = response as Uint8List;
      final messageId = ByteData.view(bytes.buffer).getInt32(0, Endian.big);
      // indeed a sublist view of the bytes
      completers.remove(messageId)!.complete(bytes);
    };
  }

  @override
  Future<void> teardown() async {
    receivePort.close();
  }

  @override
  Future<void> run() async {
    final messageId = nextId++;
    final completer = Completer<Uint8List>();
    completers[messageId] = completer;

    rawWire.benchmark_raw_output_bytes(sendPort, messageId, len);
    final result = await completer.future;

    // sanity check
    if (result.length != len + 4) throw Exception();
  }
}
  ''';
}

List<String> _benchmarkBinaryTree() {
  return '''
const _kBinaryTreeNodeName = 'HelloWorld';

BenchmarkBinaryTreeTwinSync _createTree(int depth) {
  if (depth == 0) {
    return BenchmarkBinaryTreeTwinSync(
      name: _kBinaryTreeNodeName,
      left: null,
      right: null,
    );
  }
  return BenchmarkBinaryTreeTwinSync(
    name: _kBinaryTreeNodeName,
    left: _createTree(depth - 1),
    right: _createTree(depth - 1),
  );
}

BinaryTreeProtobuf _createTreeProtobuf(int depth) {
  if (depth == 0) {
    return BinaryTreeProtobuf(
      name: _kBinaryTreeNodeName,
      left: null,
      right: null,
    );
  }
  return BinaryTreeProtobuf(
    name: _kBinaryTreeNodeName,
    left: _createTreeProtobuf(depth - 1),
    right: _createTreeProtobuf(depth - 1),
  );
}

class BinaryTreeInputSyncBenchmark extends EnhancedBenchmarkBase {
  final BenchmarkBinaryTreeTwinSync tree;

  BinaryTreeInputSyncBenchmark(int depth, {super.emitter})
      : tree = _createTree(depth),
        super('BinaryTreeInputSync_Depth\$depth');

  @override
  void run() => benchmarkBinaryTreeInputTwinSync(tree: tree);
}

class BinaryTreeOutputSyncBenchmark extends EnhancedBenchmarkBase {
  final int depth;

  BinaryTreeOutputSyncBenchmark(this.depth, {super.emitter})
      : super('BinaryTreeOutputSync_Depth\$depth');

  @override
  void run() => benchmarkBinaryTreeOutputTwinSync(depth: depth);
}

class BinaryTreeInputSyncSseBenchmark extends EnhancedBenchmarkBase {
  final BenchmarkBinaryTreeTwinSyncSse tree;

  BinaryTreeInputSyncSseBenchmark(int depth, {super.emitter})
      : tree = _createTree(depth),
        super('BinaryTreeInputSyncSse_Depth\$depth');

  static BenchmarkBinaryTreeTwinSyncSse _createTree(int depth) {
    if (depth == 0) {
      return BenchmarkBinaryTreeTwinSyncSse(
        name: _kBinaryTreeNodeName,
        left: null,
        right: null,
      );
    }
    return BenchmarkBinaryTreeTwinSyncSse(
      name: _kBinaryTreeNodeName,
      left: _createTree(depth - 1),
      right: _createTree(depth - 1),
    );
  }

  @override
  void run() => benchmarkBinaryTreeInputTwinSyncSse(tree: tree);
}

class BinaryTreeOutputSyncSseBenchmark extends EnhancedBenchmarkBase {
  final int depth;

  BinaryTreeOutputSyncSseBenchmark(this.depth, {super.emitter})
      : super('BinaryTreeOutputSyncSse_Depth\$depth');

  @override
  void run() => benchmarkBinaryTreeOutputTwinSyncSse(depth: depth);
}

class BinaryTreeInputSyncProtobufBenchmark extends EnhancedBenchmarkBase {
  final BinaryTreeProtobuf tree;

  BinaryTreeInputSyncProtobufBenchmark(int depth, {super.emitter})
      : tree = _createTreeProtobuf(depth),
        super('BinaryTreeInputSyncProtobuf_Depth\$depth');

  @override
  void run() =>
      benchmarkBinaryTreeInputProtobufTwinSync(raw: tree.writeToBuffer());
}

class BinaryTreeOutputSyncProtobufBenchmark extends EnhancedBenchmarkBase {
  final int depth;

  BinaryTreeOutputSyncProtobufBenchmark(this.depth, {super.emitter})
      : super('BinaryTreeOutputSyncProtobuf_Depth\$depth');

  @override
  void run() {
    final raw = benchmarkBinaryTreeOutputProtobufTwinSync(depth: depth);
    final proto = BinaryTreeProtobuf.fromBuffer(raw);
    dummyValue ^= proto.hashCode;
  }
}

class BinaryTreeInputSyncJsonBenchmark extends EnhancedBenchmarkBase {
  final BenchmarkBinaryTreeTwinSync tree;

  BinaryTreeInputSyncJsonBenchmark(int depth, {super.emitter})
      : tree = _createTree(depth),
        super('BinaryTreeInputSyncJson_Depth\$depth');

  // Normally use `json_serializable`, but we only use for benchmark so manually write
  static Map<String, dynamic> _toJson(dynamic tree) => {
        'name': tree.name,
        'left': tree.left,
        'right': tree.right,
      };

  @override
  void run() => benchmarkBinaryTreeInputJsonTwinSync(
      raw: jsonEncode(tree, toEncodable: _toJson));
}

class BinaryTreeOutputSyncJsonBenchmark extends EnhancedBenchmarkBase {
  final int depth;

  BinaryTreeOutputSyncJsonBenchmark(this.depth, {super.emitter})
      : super('BinaryTreeOutputSyncJson_Depth\$depth');

  @override
  void run() {
    final raw = benchmarkBinaryTreeOutputJsonTwinSync(depth: depth);
    // TODO: Should use json_serialize to further generate Dart objects
    // Otherwise this comparison is unfair (JSON does fewer amount of work)
    final json = jsonDecode(raw);
    dummyValue ^= json.hashCode;
  }
}
  ''';
}

List<String> _benchmarkBlob() {
  return '''
class BlobInputSyncBenchmark extends EnhancedBenchmarkBase {
  final BenchmarkBlobTwinSync blob;

  BlobInputSyncBenchmark(int len, {super.emitter})
      : blob = BenchmarkBlobTwinSync(
          first: Uint8List(len),
          second: Uint8List(len),
          third: Uint8List(len),
        ),
        super('BlobInputSyncBenchmark_Len\$len');

  @override
  void run() => benchmarkBlobInputTwinSync(blob: blob);
}

class BlobOutputSyncBenchmark extends EnhancedBenchmarkBase {
  final int len;

  BlobOutputSyncBenchmark(this.len, {super.emitter})
      : super('BlobOutputSync_Len\$len');

  @override
  void run() => benchmarkBlobOutputTwinSync(size: len);
}

BenchmarkBlobTwinSyncSse _createBlob(int len) => BenchmarkBlobTwinSyncSse(
      first: Uint8List(len),
      second: Uint8List(len),
      third: Uint8List(len),
    );

class BlobInputSyncSseBenchmark extends EnhancedBenchmarkBase {
  final BenchmarkBlobTwinSyncSse blob;

  BlobInputSyncSseBenchmark(int len, {super.emitter})
      : blob = _createBlob(len),
        super('BlobInputSyncSseBenchmark_Len\$len');

  @override
  void run() => benchmarkBlobInputTwinSyncSse(blob: blob);
}

class BlobOutputSyncSseBenchmark extends EnhancedBenchmarkBase {
  final int len;

  BlobOutputSyncSseBenchmark(this.len, {super.emitter})
      : super('BlobOutputSyncSse_Len\$len');

  @override
  void run() => benchmarkBlobOutputTwinSyncSse(size: len);
}

class BlobInputSyncProtobufBenchmark extends EnhancedBenchmarkBase {
  final BlobProtobuf blob;

  BlobInputSyncProtobufBenchmark(int len, {super.emitter})
      : blob = BlobProtobuf(
          first: Uint8List(len),
          second: Uint8List(len),
          third: Uint8List(len),
        ),
        super('BlobInputSyncProtobufBenchmark_Len\$len');

  @override
  void run() => benchmarkBlobInputProtobufTwinSync(raw: blob.writeToBuffer());
}

class BlobOutputSyncProtobufBenchmark extends EnhancedBenchmarkBase {
  final int len;

  BlobOutputSyncProtobufBenchmark(this.len, {super.emitter})
      : super('BlobOutputSyncProtobuf_Len\$len');

  @override
  void run() {
    final raw = benchmarkBlobOutputProtobufTwinSync(size: len);
    final proto = BlobProtobuf.fromBuffer(raw);
    dummyValue ^= proto.hashCode;
  }
}

class BlobInputSyncJsonBenchmark extends EnhancedBenchmarkBase {
  final BenchmarkBlobTwinSyncSse blob;

  BlobInputSyncJsonBenchmark(int len, {super.emitter})
      : blob = _createBlob(len),
        super('BlobInputSyncJsonBenchmark_Len\$len');

  // Normally use `json_serializable`, but we only use for benchmark so manually write
  static Map<String, dynamic> _toJson(dynamic blob) => {
        'first': blob.first,
        'second': blob.second,
        'third': blob.third,
      };

  @override
  void run() => benchmarkBlobInputJsonTwinSync(
      raw: jsonEncode(blob, toEncodable: _toJson));
}

class BlobOutputSyncJsonBenchmark extends EnhancedBenchmarkBase {
  final int len;

  BlobOutputSyncJsonBenchmark(this.len, {super.emitter})
      : super('BlobOutputSyncJson_Len\$len');

  @override
  void run() {
    final raw = benchmarkBlobOutputJsonTwinSync(size: len);
    // TODO: Should use json_serialize to further generate Dart objects
    // Otherwise this comparison is unfair (JSON does fewer amount of work)
    final json = jsonDecode(raw);
    dummyValue ^= json.hashCode;
  }
}
  ''';
}
