// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 1.82.4.

// ignore_for_file: invalid_use_of_internal_member, unused_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<NewTypeIntTwinNormal> handleNewtypeTwinNormal(
        {required NewTypeIntTwinNormal arg, dynamic hint}) =>
    RustLib.instance.api.handleNewtypeTwinNormal(arg: arg, hint: hint);

class NewTypeIntTwinNormal {
  final int field0;

  const NewTypeIntTwinNormal({
    required this.field0,
  });

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewTypeIntTwinNormal &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}
