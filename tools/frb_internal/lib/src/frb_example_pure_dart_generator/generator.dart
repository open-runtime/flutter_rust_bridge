import 'dart:io';

import 'package:flutter_rust_bridge_internal/src/frb_example_pure_dart_generator/dart/entrypoint.dart';
import 'package:flutter_rust_bridge_internal/src/frb_example_pure_dart_generator/rust/entrypoint.dart';

Future<void> generate() async {
  final dartRoot = Directory.current.uri.resolve('../../frb_example/pure_dart/');
  if (!Directory(dartRoot.toFilePath()).existsSync()) throw StateError('dartRoot=$dartRoot does not exist');

  await RustGenerator(baseDir: dartRoot.resolve('rust/src/api/')).generate();
  await DartGenerator(baseDir: dartRoot.resolve('test/api/')).generate();
}
