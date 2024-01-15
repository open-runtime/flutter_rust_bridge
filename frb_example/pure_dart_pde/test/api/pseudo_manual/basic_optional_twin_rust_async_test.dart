// NOTE: This file is mimicking how a human developer writes tests,
// and is auto-generated from `basic_optional_test.dart` by frb_internal
// Please do not modify manually, but modify the origin and re-run frb_internal generator

// NOTE: This file is mimicking how a human developer writes tests,
// and is auto-generated by frb_internal
// Please do not modify manually, but modify the origin and re-run frb_internal generator

import 'package:frb_example_pure_dart/src/rust/api/pseudo_manual/basic_optional_twin_rust_async.dart';
import 'package:frb_example_pure_dart/src/rust/frb_generated.dart';
import 'package:test/test.dart';
import '../../test_utils.dart';
import 'dart:typed_data';
import 'package:frb_example_pure_dart/src/rust/api/pseudo_manual/basic_twin_rust_async.dart';

Future<void> main({bool skipRustLibInit = false}) async {
  if (!skipRustLibInit) await RustLib.init();

  group('basic_optional', () {
    addTestsIdentityFunctionCall(
        exampleBasicOptionalTypeI8TwinRustAsync, <int?>[null, 0, -128, 127]);
    addTestsIdentityFunctionCall(exampleBasicOptionalTypeI16TwinRustAsync,
        <int?>[null, 0, -32768, 32767]);
    addTestsIdentityFunctionCall(exampleBasicOptionalTypeI32TwinRustAsync,
        <int?>[null, 0, -2147483648, 2147483647]);
    addTestsIdentityFunctionCall(exampleBasicOptionalTypeI64TwinRustAsync,
        <int?>[null, 0, -9007199254740992, 9007199254740992]);
    addTestsIdentityFunctionCall(
        exampleBasicOptionalTypeU8TwinRustAsync, <int?>[null, 0, 255]);
    addTestsIdentityFunctionCall(
        exampleBasicOptionalTypeU16TwinRustAsync, <int?>[null, 0, 65535]);
    addTestsIdentityFunctionCall(
        exampleBasicOptionalTypeU32TwinRustAsync, <int?>[null, 0, 4294967295]);
    addTestsIdentityFunctionCall(exampleBasicOptionalTypeU64TwinRustAsync,
        <int?>[null, 0, 9007199254740992]);
    addTestsIdentityFunctionCall(exampleBasicOptionalTypeIsizeTwinRustAsync,
        <int?>[null, 0, -2147483648, 2147483647]);
    addTestsIdentityFunctionCall(exampleBasicOptionalTypeUsizeTwinRustAsync,
        <int?>[null, 0, 4294967295]);
    addTestsIdentityFunctionCall(exampleBasicOptionalTypeF32TwinRustAsync,
        <double?>[null, 0, -42.5, 123456]);
    addTestsIdentityFunctionCall(exampleBasicOptionalTypeF64TwinRustAsync,
        <double?>[null, 0, -42.5, 123456]);
    addTestsIdentityFunctionCall(
        exampleBasicOptionalTypeBoolTwinRustAsync, <bool?>[null, false, true]);
    addTestsIdentityFunctionCall(exampleBasicOptionalTypeStringTwinRustAsync,
        <String?>[null, "", "hello", "😂"]);
    addTestsIdentityFunctionCall(
        exampleBasicOptionalTypeBytesTwinRustAsync, <Uint8List?>[
      null,
      Uint8List.fromList([]),
      Uint8List.fromList([255, 0]),
      Uint8List.fromList([10, 20, 30, 40])
    ]);
    addTestsIdentityFunctionCall(
        exampleBasicOptionalTypeBasicPrimitiveEnumTwinRustAsyncTwinRustAsync,
        <BasicPrimitiveEnumTwinRustAsync?>[
          null,
          BasicPrimitiveEnumTwinRustAsync.apple,
          BasicPrimitiveEnumTwinRustAsync.orange
        ]);
    addTestsIdentityFunctionCall(
        exampleBasicOptionalTypeBasicGeneralEnumTwinRustAsyncTwinRustAsync,
        <BasicGeneralEnumTwinRustAsync?>[
          null,
          BasicGeneralEnumTwinRustAsync.apple(field: "one"),
          BasicGeneralEnumTwinRustAsync.orange()
        ]);
    addTestsIdentityFunctionCall(
        exampleBasicOptionalTypeBasicStructTwinRustAsyncTwinRustAsync,
        <BasicStructTwinRustAsync?>[
          null,
          BasicStructTwinRustAsync(apple: null, orange: null),
          BasicStructTwinRustAsync(apple: "one", orange: 42)
        ]);
  });
}
