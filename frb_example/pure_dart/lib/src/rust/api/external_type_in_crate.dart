// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 1.82.4.

// ignore_for_file: invalid_use_of_internal_member, unused_import

import '../auxiliary/new_module_system/sub_module.dart';
import '../auxiliary/old_module_system/sub_module.dart';
import '../auxiliary/sample_types.dart';
import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<bool> useImportedStructTwinNormal(
        {required MyStruct myStruct, dynamic hint}) =>
    RustLib.instance.api
        .useImportedStructTwinNormal(myStruct: myStruct, hint: hint);

Future<bool> useImportedEnumTwinNormal(
        {required MyEnum myEnum, dynamic hint}) =>
    RustLib.instance.api.useImportedEnumTwinNormal(myEnum: myEnum, hint: hint);

Future<OldSimpleStruct> callOldModuleSystemTwinNormal({dynamic hint}) =>
    RustLib.instance.api.callOldModuleSystemTwinNormal(hint: hint);

Future<NewSimpleStruct> callNewModuleSystemTwinNormal({dynamic hint}) =>
    RustLib.instance.api.callNewModuleSystemTwinNormal(hint: hint);
