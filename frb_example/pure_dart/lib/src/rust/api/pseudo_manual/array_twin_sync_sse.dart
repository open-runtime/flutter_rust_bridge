// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.23.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import '../array.dart';
import 'package:collection/collection.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

U8Array5 getArrayTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.getArrayTwinSyncSse(hint: hint);

PointTwinSyncSseArray2 getComplexArrayTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.getComplexArrayTwinSyncSse(hint: hint);

MessageIdTwinSyncSse newMsgidTwinSyncSse(
        {required U8Array32 id, dynamic hint}) =>
    RustLib.instance.api.newMsgidTwinSyncSse(id: id, hint: hint);

U8Array32 useMsgidTwinSyncSse(
        {required MessageIdTwinSyncSse id, dynamic hint}) =>
    RustLib.instance.api.useMsgidTwinSyncSse(id: id, hint: hint);

BlobTwinSyncSse boxedBlobTwinSyncSse(
        {required U8Array1600 blob, dynamic hint}) =>
    RustLib.instance.api.boxedBlobTwinSyncSse(blob: blob, hint: hint);

U8Array1600 useBoxedBlobTwinSyncSse(
        {required BlobTwinSyncSse blob, dynamic hint}) =>
    RustLib.instance.api.useBoxedBlobTwinSyncSse(blob: blob, hint: hint);

FeedIdTwinSyncSse returnBoxedFeedIdTwinSyncSse(
        {required U8Array8 id, dynamic hint}) =>
    RustLib.instance.api.returnBoxedFeedIdTwinSyncSse(id: id, hint: hint);

U8Array8 returnBoxedRawFeedIdTwinSyncSse(
        {required FeedIdTwinSyncSse id, dynamic hint}) =>
    RustLib.instance.api.returnBoxedRawFeedIdTwinSyncSse(id: id, hint: hint);

TestIdTwinSyncSse funcTestIdTwinSyncSse(
        {required TestIdTwinSyncSse id, dynamic hint}) =>
    RustLib.instance.api.funcTestIdTwinSyncSse(id: id, hint: hint);

double lastNumberTwinSyncSse({required F64Array16 array, dynamic hint}) =>
    RustLib.instance.api.lastNumberTwinSyncSse(array: array, hint: hint);

TestIdTwinSyncSseArray2 nestedIdTwinSyncSse(
        {required TestIdTwinSyncSseArray4 id, dynamic hint}) =>
    RustLib.instance.api.nestedIdTwinSyncSse(id: id, hint: hint);

class BlobTwinSyncSse {
  final U8Array1600 field0;

  const BlobTwinSyncSse({
    required this.field0,
  });

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlobTwinSyncSse &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}

class FeedIdTwinSyncSse {
  final U8Array8 field0;

  const FeedIdTwinSyncSse({
    required this.field0,
  });

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedIdTwinSyncSse &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}

class MessageIdTwinSyncSse {
  final U8Array32 field0;

  const MessageIdTwinSyncSse({
    required this.field0,
  });

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageIdTwinSyncSse &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}

class PointTwinSyncSse {
  final double x;
  final double y;

  const PointTwinSyncSse({
    required this.x,
    required this.y,
  });

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PointTwinSyncSse &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;
}

class PointTwinSyncSseArray2 extends NonGrowableListView<PointTwinSyncSse> {
  static const arraySize = 2;

  @internal
  List<PointTwinSyncSse> get inner => _inner;
  final List<PointTwinSyncSse> _inner;

  PointTwinSyncSseArray2(this._inner)
      : assert(_inner.length == arraySize),
        super(_inner);

  PointTwinSyncSseArray2.init(PointTwinSyncSse fill)
      : this(List<PointTwinSyncSse>.filled(arraySize, fill));
}

class TestIdTwinSyncSse {
  final I32Array2 field0;

  const TestIdTwinSyncSse({
    required this.field0,
  });

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestIdTwinSyncSse &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}

class TestIdTwinSyncSseArray2 extends NonGrowableListView<TestIdTwinSyncSse> {
  static const arraySize = 2;

  @internal
  List<TestIdTwinSyncSse> get inner => _inner;
  final List<TestIdTwinSyncSse> _inner;

  TestIdTwinSyncSseArray2(this._inner)
      : assert(_inner.length == arraySize),
        super(_inner);

  TestIdTwinSyncSseArray2.init(TestIdTwinSyncSse fill)
      : this(List<TestIdTwinSyncSse>.filled(arraySize, fill));
}

class TestIdTwinSyncSseArray4 extends NonGrowableListView<TestIdTwinSyncSse> {
  static const arraySize = 4;

  @internal
  List<TestIdTwinSyncSse> get inner => _inner;
  final List<TestIdTwinSyncSse> _inner;

  TestIdTwinSyncSseArray4(this._inner)
      : assert(_inner.length == arraySize),
        super(_inner);

  TestIdTwinSyncSseArray4.init(TestIdTwinSyncSse fill)
      : this(List<TestIdTwinSyncSse>.filled(arraySize, fill));
}
