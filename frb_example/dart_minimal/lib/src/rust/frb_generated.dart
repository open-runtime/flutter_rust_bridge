// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 1.82.4.

// ignore_for_file: unused_import, unused_element, duplicate_ignore, invalid_use_of_internal_member

import 'dart:async';
import 'dart:convert';

import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

import 'api/minimal.dart';
import 'frb_generated.io.dart' if (dart.library.html) 'frb_generated.web.dart';

/// Main entrypoint of the Rust API
class RustLib extends BaseEntrypoint<RustLibApi, RustLibApiImpl, RustLibWire> {
  @internal
  static final instance = RustLib._();

  RustLib._();

  /// Initialize flutter_rust_bridge
  static Future<void> init({
    RustLibApi? api,
    BaseHandler? handler,
    ExternalLibrary? externalLibrary,
  }) async {
    await instance.initImpl(
      api: api,
      handler: handler,
      externalLibrary: externalLibrary,
    );
  }

  /// Dispose flutter_rust_bridge
  ///
  /// The call to this function is optional, since flutter_rust_bridge (and everything else)
  /// is automatically disposed when the app stops.
  static void dispose() => instance.disposeImpl();

  @override
  ApiImplConstructor<RustLibApiImpl, RustLibWire> get apiImplConstructor =>
      RustLibApiImpl.new;

  @override
  WireConstructor<RustLibWire> get wireConstructor =>
      RustLibWire.fromExternalLibrary;

  @override
  ExternalLibraryLoaderConfig get defaultExternalLibraryLoaderConfig =>
      kDefaultExternalLibraryLoaderConfig;

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
    stem: 'frb_example_dart_minimal',
    ioDirectory: 'rust/target/release/',
    webPrefix: 'pkg/',
  );
}

abstract class RustLibApi extends BaseApi {
  Future<int> minimalAdder({required int a, required int b, dynamic hint});

  Future<void> rustCallDartSimple(
      {required String Function(String, String) callback, dynamic hint});
}

class RustLibApiImpl extends RustLibApiImplPlatform implements RustLibApi {
  RustLibApiImpl({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @override
  Future<int> minimalAdder({required int a, required int b, dynamic hint}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        _sse_encode_i_32(a, serializer);
        _sse_encode_i_32(b, serializer);
        final raw_ = serializer.intoRaw();
        return wire.wire_minimal_adder(
            port_, raw_.ptr, raw_.rustVecLen, raw_.dataLen);
      },
      codec: SseCodec(
        decodeSuccessData: _sse_decode_i_32,
        decodeErrorData: null,
      ),
      constMeta: kMinimalAdderConstMeta,
      argValues: [a, b],
      apiImpl: this,
      hint: hint,
    ));
  }

  TaskConstMeta get kMinimalAdderConstMeta => const TaskConstMeta(
        debugName: "minimal_adder",
        argNames: ["a", "b"],
      );

  @override
  Future<void> rustCallDartSimple(
      {required String Function(String, String) callback, dynamic hint}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        var arg0 =
            cst_encode_DartFn_Inputs_String_String_Output_String(callback);
        return wire.wire_rust_call_dart_simple(port_, arg0);
      },
      codec: DcoCodec(
        decodeSuccessData: _dco_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kRustCallDartSimpleConstMeta,
      argValues: [callback],
      apiImpl: this,
      hint: hint,
    ));
  }

  TaskConstMeta get kRustCallDartSimpleConstMeta => const TaskConstMeta(
        debugName: "rust_call_dart_simple",
        argNames: ["callback"],
      );

  String Function(String, String)
      _dco_decode_DartFn_Inputs_String_String_Output_String(dynamic raw) {
    throw UnimplementedError();
  }

  Object _dco_decode_DartOpaque(dynamic raw) {
    return decodeDartOpaque(raw, generalizedFrbRustBinding);
  }

  String _dco_decode_String(dynamic raw) {
    return raw as String;
  }

  int _dco_decode_i_32(dynamic raw) {
    return raw as int;
  }

  Uint8List _dco_decode_list_prim_u_8(dynamic raw) {
    return raw as Uint8List;
  }

  int _dco_decode_u_8(dynamic raw) {
    return raw as int;
  }

  void _dco_decode_unit(dynamic raw) {
    return;
  }

  int _dco_decode_usize(dynamic raw) {
    return dcoDecodeI64OrU64(raw);
  }

  String Function(String, String)
      _sse_decode_DartFn_Inputs_String_String_Output_String(
          SseDeserializer deserializer) {
    throw UnimplementedError();
  }

  Object _sse_decode_DartOpaque(SseDeserializer deserializer) {
    var inner = _sse_decode_usize(deserializer);
    return decodeDartOpaque(inner, generalizedFrbRustBinding);
  }

  String _sse_decode_String(SseDeserializer deserializer) {
    var inner = _sse_decode_list_prim_u_8(deserializer);
    return utf8.decoder.convert(inner);
  }

  int _sse_decode_i_32(SseDeserializer deserializer) {
    return deserializer.buffer.getInt32();
  }

  Uint8List _sse_decode_list_prim_u_8(SseDeserializer deserializer) {
    var len_ = _sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  int _sse_decode_u_8(SseDeserializer deserializer) {
    return deserializer.buffer.getUint8();
  }

  void _sse_decode_unit(SseDeserializer deserializer) {}

  int _sse_decode_usize(SseDeserializer deserializer) {
    return deserializer.buffer.getUint64();
  }

  @protected
  PlatformPointer cst_encode_DartFn_Inputs_String_String_Output_String(
      String Function(String, String) raw) {
    // TODO this is manual tweak
    final closure = (int callId, dynamic arg1Raw, dynamic arg2Raw) {
      final arg1 = _dco_decode_String(arg1Raw);
      final arg2 = _dco_decode_String(arg2Raw);

      final outputRaw = raw(arg1, arg2);

      final serializer = SseSerializer(generalizedFrbRustBinding);
      _sse_encode_String(outputRaw, serializer);
      final output = serializer.intoRaw();

      wire.dart_fn_deliver_output(
          callId, output.ptr, output.rustVecLen, output.dataLen);
    };
    return cst_encode_DartOpaque(closure);
  }

  @protected
  int cst_encode_i_32(int raw) {
    return raw;
  }

  @protected
  int cst_encode_u_8(int raw) {
    return raw;
  }

  @protected
  void cst_encode_unit(void raw) {
    return raw;
  }

  @protected
  int cst_encode_usize(int raw) {
    return raw;
  }

  void _sse_encode_DartFn_Inputs_String_String_Output_String(
      String Function(String, String) self, SseSerializer serializer) {
    _sse_encode_DartOpaque(self, serializer);
  }

  void _sse_encode_DartOpaque(Object self, SseSerializer serializer) {
    _sse_encode_usize(
        PlatformPointerUtil.ptrToInt(wire.dart_opaque_dart2rust_encode(self)),
        serializer);
  }

  void _sse_encode_String(String self, SseSerializer serializer) {
    _sse_encode_list_prim_u_8(utf8.encoder.convert(self), serializer);
  }

  void _sse_encode_i_32(int self, SseSerializer serializer) {
    serializer.buffer.putInt32(self);
  }

  void _sse_encode_list_prim_u_8(Uint8List self, SseSerializer serializer) {
    _sse_encode_i_32(self.length, serializer);
    serializer.buffer.putUint8List(self);
  }

  void _sse_encode_u_8(int self, SseSerializer serializer) {
    serializer.buffer.putUint8(self);
  }

  void _sse_encode_unit(void self, SseSerializer serializer) {}

  void _sse_encode_usize(int self, SseSerializer serializer) {
    serializer.buffer.putUint64(self);
  }
}
