// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 1.82.4.

// ignore_for_file: unused_import, unused_element, duplicate_ignore, invalid_use_of_internal_member

import 'api/minimal.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi' as ffi;
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_io.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @protected
  TheEnum dco_decode_box_autoadd_the_enum(dynamic raw);

  @protected
  int dco_decode_i_32(dynamic raw);

  @protected
  TheEnum dco_decode_the_enum(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  TheEnum sse_decode_box_autoadd_the_enum(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  TheEnum sse_decode_the_enum(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  ffi.Pointer<wire_cst_the_enum> cst_encode_box_autoadd_the_enum(TheEnum raw) {
    final ptr = wire.cst_new_box_autoadd_the_enum();
    cst_api_fill_to_wire_the_enum(raw, ptr.ref);
    return ptr;
  }

  @protected
  void cst_api_fill_to_wire_box_autoadd_the_enum(
      TheEnum apiObj, ffi.Pointer<wire_cst_the_enum> wireObj) {
    cst_api_fill_to_wire_the_enum(apiObj, wireObj.ref);
  }

  @protected
  void cst_api_fill_to_wire_the_enum(
      TheEnum apiObj, wire_cst_the_enum wireObj) {
    if (apiObj is TheEnum_TheVariant) {
      var pre_field0 = cst_encode_i_32(apiObj.field0);
      wireObj.tag = 0;
      wireObj.kind = wire.cst_inflate_TheEnum_TheVariant();
      wireObj.kind.ref.TheVariant.ref.field0 = pre_field0;
      return;
    }
  }

  @protected
  int cst_encode_i_32(int raw);

  @protected
  void cst_encode_unit(void raw);

  @protected
  void sse_encode_box_autoadd_the_enum(TheEnum self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_the_enum(TheEnum self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);
}

// Section: wire_class

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names
// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint

/// generated by flutter_rust_bridge
class RustLibWire implements BaseWire {
  factory RustLibWire.fromExternalLibrary(ExternalLibrary lib) =>
      RustLibWire(lib.ffiDynamicLibrary);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RustLibWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  RustLibWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void frb_initialize_rust(
    int dart_opaque_drop_port,
    int dart_fn_invoke_port,
  ) {
    return _frb_initialize_rust(
      dart_opaque_drop_port,
      dart_fn_invoke_port,
    );
  }

  late final _frb_initialize_rustPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int, ffi.Int)>>(
          'frb_initialize_rust');
  late final _frb_initialize_rust =
      _frb_initialize_rustPtr.asFunction<void Function(int, int)>();

  void dart_fn_deliver_output(
    int call_id,
    ffi.Pointer<ffi.Uint8> ptr_,
    int rust_vec_len_,
    int data_len_,
  ) {
    return _dart_fn_deliver_output(
      call_id,
      ptr_,
      rust_vec_len_,
      data_len_,
    );
  }

  late final _dart_fn_deliver_outputPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int32, ffi.Pointer<ffi.Uint8>, ffi.Int32,
              ffi.Int32)>>('dart_fn_deliver_output');
  late final _dart_fn_deliver_output = _dart_fn_deliver_outputPtr
      .asFunction<void Function(int, ffi.Pointer<ffi.Uint8>, int, int)>();

  void wire_hi(
    int port_,
    ffi.Pointer<wire_cst_the_enum> a,
  ) {
    return _wire_hi(
      port_,
      a,
    );
  }

  late final _wire_hiPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Pointer<wire_cst_the_enum>)>>('wire_hi');
  late final _wire_hi = _wire_hiPtr
      .asFunction<void Function(int, ffi.Pointer<wire_cst_the_enum>)>();

  void wire_minimal_adder(
    int port_,
    int a,
    int b,
  ) {
    return _wire_minimal_adder(
      port_,
      a,
      b,
    );
  }

  late final _wire_minimal_adderPtr = _lookup<
          ffi
          .NativeFunction<ffi.Void Function(ffi.Int64, ffi.Int32, ffi.Int32)>>(
      'wire_minimal_adder');
  late final _wire_minimal_adder =
      _wire_minimal_adderPtr.asFunction<void Function(int, int, int)>();

  ffi.Pointer<wire_cst_the_enum> cst_new_box_autoadd_the_enum() {
    return _cst_new_box_autoadd_the_enum();
  }

  late final _cst_new_box_autoadd_the_enumPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_cst_the_enum> Function()>>(
          'cst_new_box_autoadd_the_enum');
  late final _cst_new_box_autoadd_the_enum = _cst_new_box_autoadd_the_enumPtr
      .asFunction<ffi.Pointer<wire_cst_the_enum> Function()>();

  ffi.Pointer<TheEnumKind> cst_inflate_TheEnum_TheVariant() {
    return _cst_inflate_TheEnum_TheVariant();
  }

  late final _cst_inflate_TheEnum_TheVariantPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<TheEnumKind> Function()>>(
          'cst_inflate_TheEnum_TheVariant');
  late final _cst_inflate_TheEnum_TheVariant =
      _cst_inflate_TheEnum_TheVariantPtr
          .asFunction<ffi.Pointer<TheEnumKind> Function()>();

  int dummy_method_to_enforce_bundling() {
    return _dummy_method_to_enforce_bundling();
  }

  late final _dummy_method_to_enforce_bundlingPtr =
      _lookup<ffi.NativeFunction<ffi.Int64 Function()>>(
          'dummy_method_to_enforce_bundling');
  late final _dummy_method_to_enforce_bundling =
      _dummy_method_to_enforce_bundlingPtr.asFunction<int Function()>();
}

final class wire_cst_TheEnum_TheVariant extends ffi.Struct {
  @ffi.Int32()
  external int field0;
}

final class TheEnumKind extends ffi.Union {
  external ffi.Pointer<wire_cst_TheEnum_TheVariant> TheVariant;
}

final class wire_cst_the_enum extends ffi.Struct {
  @ffi.Int32()
  external int tag;

  external ffi.Pointer<TheEnumKind> kind;
}
