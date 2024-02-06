// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.23.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../auxiliary/sample_types.dart';
import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
part 'mirror_twin_sync.freezed.dart';

ApplicationSettings getAppSettingsTwinSync({dynamic hint}) =>
    RustLib.instance.api.getAppSettingsTwinSync(hint: hint);

ApplicationSettings getFallibleAppSettingsTwinSync({dynamic hint}) =>
    RustLib.instance.api.getFallibleAppSettingsTwinSync(hint: hint);

bool isAppEmbeddedTwinSync(
        {required ApplicationSettings appSettings, dynamic hint}) =>
    RustLib.instance.api
        .isAppEmbeddedTwinSync(appSettings: appSettings, hint: hint);

Stream<ApplicationSettings> appSettingsStreamTwinSync({dynamic hint}) =>
    RustLib.instance.api.appSettingsStreamTwinSync(hint: hint);

Stream<List<ApplicationSettings>> appSettingsVecStreamTwinSync(
        {dynamic hint}) =>
    RustLib.instance.api.appSettingsVecStreamTwinSync(hint: hint);

Stream<MirrorStructTwinSync> mirrorStructStreamTwinSync({dynamic hint}) =>
    RustLib.instance.api.mirrorStructStreamTwinSync(hint: hint);

Stream<(ApplicationSettings, RawStringEnumMirrored)> mirrorTupleStreamTwinSync(
        {dynamic hint}) =>
    RustLib.instance.api.mirrorTupleStreamTwinSync(hint: hint);

ApplicationMessage getMessageTwinSync({dynamic hint}) =>
    RustLib.instance.api.getMessageTwinSync(hint: hint);

Numbers repeatNumberTwinSync(
        {required int num, required int times, dynamic hint}) =>
    RustLib.instance.api
        .repeatNumberTwinSync(num: num, times: times, hint: hint);

Sequences repeatSequenceTwinSync(
        {required int seq, required int times, dynamic hint}) =>
    RustLib.instance.api
        .repeatSequenceTwinSync(seq: seq, times: times, hint: hint);

int? firstNumberTwinSync({required Numbers nums, dynamic hint}) =>
    RustLib.instance.api.firstNumberTwinSync(nums: nums, hint: hint);

int? firstSequenceTwinSync({required Sequences seqs, dynamic hint}) =>
    RustLib.instance.api.firstSequenceTwinSync(seqs: seqs, hint: hint);

RawStringMirrored testRawStringMirroredTwinSync({dynamic hint}) =>
    RustLib.instance.api.testRawStringMirroredTwinSync(hint: hint);

NestedRawStringMirrored testNestedRawStringMirroredTwinSync({dynamic hint}) =>
    RustLib.instance.api.testNestedRawStringMirroredTwinSync(hint: hint);

RawStringEnumMirrored testRawStringEnumMirroredTwinSync(
        {required bool nested, dynamic hint}) =>
    RustLib.instance.api
        .testRawStringEnumMirroredTwinSync(nested: nested, hint: hint);

ListOfNestedRawStringMirrored testListOfRawNestedStringMirroredTwinSync(
        {dynamic hint}) =>
    RustLib.instance.api.testListOfRawNestedStringMirroredTwinSync(hint: hint);

List<RawStringMirrored> testFallibleOfRawStringMirroredTwinSync(
        {dynamic hint}) =>
    RustLib.instance.api.testFallibleOfRawStringMirroredTwinSync(hint: hint);

List<RawStringEnumMirrored> testListOfNestedEnumsMirroredTwinSync(
        {dynamic hint}) =>
    RustLib.instance.api.testListOfNestedEnumsMirroredTwinSync(hint: hint);

ContainsMirroredSubStructTwinSync testContainsMirroredSubStructTwinSync(
        {dynamic hint}) =>
    RustLib.instance.api.testContainsMirroredSubStructTwinSync(hint: hint);

StructWithHashMap testHashmapWithMirroredValueTwinSync({dynamic hint}) =>
    RustLib.instance.api.testHashmapWithMirroredValueTwinSync(hint: hint);

class AnotherTwinSync {
  final String a;

  const AnotherTwinSync({
    required this.a,
  });

  @override
  int get hashCode => a.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnotherTwinSync &&
          runtimeType == other.runtimeType &&
          a == other.a;
}

class ApplicationEnv {
  final List<ApplicationEnvVar> vars;

  const ApplicationEnv({
    required this.vars,
  });

  @override
  int get hashCode => vars.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplicationEnv &&
          runtimeType == other.runtimeType &&
          vars == other.vars;
}

class ApplicationEnvVar {
  final String field0;
  final bool field1;

  const ApplicationEnvVar({
    required this.field0,
    required this.field1,
  });

  @override
  int get hashCode => field0.hashCode ^ field1.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplicationEnvVar &&
          runtimeType == other.runtimeType &&
          field0 == other.field0 &&
          field1 == other.field1;
}

@freezed
sealed class ApplicationMessage with _$ApplicationMessage {
  const factory ApplicationMessage.displayMessage(
    String field0,
  ) = ApplicationMessage_DisplayMessage;
  const factory ApplicationMessage.renderPixel({
    required int x,
    required int y,
  }) = ApplicationMessage_RenderPixel;
  const factory ApplicationMessage.exit() = ApplicationMessage_Exit;
}

enum ApplicationMode {
  standalone,
  embedded,
}

class ApplicationSettings {
  final String name;
  final String version;
  final ApplicationMode mode;
  final ApplicationEnv env;
  final ApplicationEnv? envOptional;

  const ApplicationSettings({
    required this.name,
    required this.version,
    required this.mode,
    required this.env,
    this.envOptional,
  });

  @override
  int get hashCode =>
      name.hashCode ^
      version.hashCode ^
      mode.hashCode ^
      env.hashCode ^
      envOptional.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplicationSettings &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          version == other.version &&
          mode == other.mode &&
          env == other.env &&
          envOptional == other.envOptional;
}

class ContainsMirroredSubStructTwinSync {
  final RawStringMirrored test;
  final AnotherTwinSync test2;

  const ContainsMirroredSubStructTwinSync({
    required this.test,
    required this.test2,
  });

  @override
  int get hashCode => test.hashCode ^ test2.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContainsMirroredSubStructTwinSync &&
          runtimeType == other.runtimeType &&
          test == other.test &&
          test2 == other.test2;
}

class HashMapValue {
  final String inner;

  const HashMapValue({
    required this.inner,
  });

  @override
  int get hashCode => inner.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HashMapValue &&
          runtimeType == other.runtimeType &&
          inner == other.inner;
}

class ListOfNestedRawStringMirrored {
  final List<NestedRawStringMirrored> raw;

  const ListOfNestedRawStringMirrored({
    required this.raw,
  });

  @override
  int get hashCode => raw.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListOfNestedRawStringMirrored &&
          runtimeType == other.runtimeType &&
          raw == other.raw;
}

class MirrorStructTwinSync {
  final ApplicationSettings a;
  final MyStruct b;
  final List<MyEnum> c;
  final List<ApplicationSettings> d;

  const MirrorStructTwinSync({
    required this.a,
    required this.b,
    required this.c,
    required this.d,
  });

  @override
  int get hashCode => a.hashCode ^ b.hashCode ^ c.hashCode ^ d.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MirrorStructTwinSync &&
          runtimeType == other.runtimeType &&
          a == other.a &&
          b == other.b &&
          c == other.c &&
          d == other.d;
}

class NestedRawStringMirrored {
  final RawStringMirrored raw;

  const NestedRawStringMirrored({
    required this.raw,
  });

  @override
  int get hashCode => raw.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NestedRawStringMirrored &&
          runtimeType == other.runtimeType &&
          raw == other.raw;
}

class Numbers {
  final Int32List field0;

  const Numbers({
    required this.field0,
  });

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Numbers &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}

@freezed
sealed class RawStringEnumMirrored with _$RawStringEnumMirrored {
  const factory RawStringEnumMirrored.raw(
    RawStringMirrored field0,
  ) = RawStringEnumMirrored_Raw;
  const factory RawStringEnumMirrored.nested(
    NestedRawStringMirrored field0,
  ) = RawStringEnumMirrored_Nested;
  const factory RawStringEnumMirrored.listOfNested(
    ListOfNestedRawStringMirrored field0,
  ) = RawStringEnumMirrored_ListOfNested;
}

class RawStringMirrored {
  final String value;

  const RawStringMirrored({
    required this.value,
  });

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RawStringMirrored &&
          runtimeType == other.runtimeType &&
          value == other.value;
}

class Sequences {
  final Int32List field0;

  const Sequences({
    required this.field0,
  });

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Sequences &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}

class StructWithHashMap {
  final Map<String, HashMapValue> map;

  const StructWithHashMap({
    required this.map,
  });

  @override
  int get hashCode => map.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StructWithHashMap &&
          runtimeType == other.runtimeType &&
          map == other.map;
}
