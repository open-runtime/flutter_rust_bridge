// NOTE: This file is mimicking how a human developer writes tests,
// and is auto-generated from `primitive_misc_test.dart` by frb_internal
// Please do not modify manually, but modify the origin and re-run frb_internal generator

// AUTO-GENERATED FROM frb_example/pure_dart, DO NOT EDIT

import 'package:frb_example_pure_dart/src/rust/api/pseudo_manual/primitive_misc_twin_sync.dart';
import 'package:frb_example_pure_dart/src/rust/frb_generated.dart';
import 'package:test/test.dart';

// NOTE majority of tests are in `pseudo_manual/*`
Future<void> main({bool skipRustLibInit = false}) async {
  if (!skipRustLibInit) await RustLib.init();

  test('dart call primitiveTypes', () async {
    expect(
        await primitiveTypesTwinSync(
            myI32: 123,
            myI64: 10000000000000,
            myF64: 12345678901234567890.123,
            myBool: true),
        42);
  });

  test('dart call primitiveU32', () async {
    expect(await primitiveU32TwinSync(myU32: 0xff112233), 0xfe112233);
  });
}
