// NOTE: This file is mimicking how a human developer writes tests,
// and is auto-generated from `tuple_test.dart` by frb_internal
// Please do not modify manually, but modify the origin and re-run frb_internal generator

// AUTO-GENERATED FROM frb_example/pure_dart, DO NOT EDIT

import 'package:frb_example_pure_dart/src/rust/api/pseudo_manual/tuple_twin_sync.dart';
import 'package:frb_example_pure_dart/src/rust/frb_generated.dart';
import 'package:test/test.dart';

Future<void> main({bool skipRustLibInit = false}) async {
  if (!skipRustLibInit) await RustLib.init();

  test("dart call tuples", () async {
    expect(await testTupleTwinSync(), ('John', 0));
    expect(await testTupleTwinSync(value: ('Bob', 42)), ('Hello Bob', 43));
  });
}
