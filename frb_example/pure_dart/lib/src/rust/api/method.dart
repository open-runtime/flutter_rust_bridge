// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 1.82.4.

// ignore_for_file: invalid_use_of_internal_member, unused_import

import '../frb_generated.dart';
import 'package:collection/collection.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<SumWithTwinNormal> getSumStructTwinNormal({dynamic hint}) =>
    RustLib.instance.api.getSumStructTwinNormal(hint: hint);

Future<SumWithTwinNormalArray3> getSumArrayTwinNormal(
        {required int a, required int b, required int c, dynamic hint}) =>
    RustLib.instance.api.getSumArrayTwinNormal(a: a, b: b, c: c, hint: hint);

class ConcatenateWithTwinNormal {
  final String a;

  const ConcatenateWithTwinNormal({
    required this.a,
  });

  static Future<String> concatenateStaticTwinNormal(
          {required String a, required String b, dynamic hint}) =>
      RustLib.instance.api.concatenateWithTwinNormalConcatenateStaticTwinNormal(
          a: a, b: b, hint: hint);

  Future<String> concatenateTwinNormal({required String b, dynamic hint}) =>
      RustLib.instance.api.concatenateWithTwinNormalConcatenateTwinNormal(
        that: this,
        b: b,
      );

  static Stream<int> handleSomeStaticStreamSinkSingleArgTwinNormal(
          {dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinNormalHandleSomeStaticStreamSinkSingleArgTwinNormal(
              hint: hint);

  static Stream<Log2TwinNormal> handleSomeStaticStreamSinkTwinNormal(
          {required int key, required int max, dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinNormalHandleSomeStaticStreamSinkTwinNormal(
              key: key, max: max, hint: hint);

  Stream<int> handleSomeStreamSinkAt1TwinNormal({dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinNormalHandleSomeStreamSinkAt1TwinNormal(
        that: this,
      );

  Stream<Log2TwinNormal> handleSomeStreamSinkTwinNormal(
          {required int key, required int max, dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinNormalHandleSomeStreamSinkTwinNormal(
        that: this,
        key: key,
        max: max,
      );

  static Future<ConcatenateWithTwinNormal> newTwinNormal(
          {required String a, dynamic hint}) =>
      RustLib.instance.api
          .concatenateWithTwinNormalNewTwinNormal(a: a, hint: hint);

  @override
  int get hashCode => a.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConcatenateWithTwinNormal &&
          runtimeType == other.runtimeType &&
          a == other.a;
}

class Log2TwinNormal {
  final int key;
  final String value;

  const Log2TwinNormal({
    required this.key,
    required this.value,
  });

  @override
  int get hashCode => key.hashCode ^ value.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Log2TwinNormal &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          value == other.value;
}

class SumWithTwinNormal {
  final int x;

  const SumWithTwinNormal({
    required this.x,
  });

  Future<int> sumTwinNormal({required int y, required int z, dynamic hint}) =>
      RustLib.instance.api.sumWithTwinNormalSumTwinNormal(
        that: this,
        y: y,
        z: z,
      );

  @override
  int get hashCode => x.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SumWithTwinNormal &&
          runtimeType == other.runtimeType &&
          x == other.x;
}

class SumWithTwinNormalArray3 extends NonGrowableListView<SumWithTwinNormal> {
  static const arraySize = 3;
  SumWithTwinNormalArray3(List<SumWithTwinNormal> inner)
      : assert(inner.length == arraySize),
        super(inner);
  SumWithTwinNormalArray3.unchecked(List<SumWithTwinNormal> inner)
      : super(inner);
  SumWithTwinNormalArray3.init(SumWithTwinNormal fill)
      : super(List<SumWithTwinNormal>.filled(arraySize, fill));
}
