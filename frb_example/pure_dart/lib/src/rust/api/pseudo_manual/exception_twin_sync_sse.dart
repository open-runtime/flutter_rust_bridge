// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.23.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
part 'exception_twin_sync_sse.freezed.dart';

int funcReturnErrorTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.funcReturnErrorTwinSyncSse(hint: hint);

int funcTypeFalliblePanicTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.funcTypeFalliblePanicTwinSyncSse(hint: hint);

int funcTypeInfalliblePanicTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.funcTypeInfalliblePanicTwinSyncSse(hint: hint);

int customEnumErrorReturnOkTwinSyncSse({required int arg, dynamic hint}) =>
    RustLib.instance.api
        .customEnumErrorReturnOkTwinSyncSse(arg: arg, hint: hint);

void customEnumErrorPanicTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.customEnumErrorPanicTwinSyncSse(hint: hint);

int customEnumErrorReturnErrorTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.customEnumErrorReturnErrorTwinSyncSse(hint: hint);

void customNestedErrorReturnErrorTwinSyncSse(
        {required CustomNestedErrorOuterTwinSyncSse arg, dynamic hint}) =>
    RustLib.instance.api
        .customNestedErrorReturnErrorTwinSyncSse(arg: arg, hint: hint);

void customStructErrorReturnErrorTwinSyncSse(
        {required CustomStructErrorTwinSyncSse arg, dynamic hint}) =>
    RustLib.instance.api
        .customStructErrorReturnErrorTwinSyncSse(arg: arg, hint: hint);

int returnErrCustomErrorTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.returnErrCustomErrorTwinSyncSse(hint: hint);

int returnOkCustomErrorTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.returnOkCustomErrorTwinSyncSse(hint: hint);

int returnErrorVariantTwinSyncSse({required int variant, dynamic hint}) =>
    RustLib.instance.api
        .returnErrorVariantTwinSyncSse(variant: variant, hint: hint);

void returnCustomNestedError1TwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.returnCustomNestedError1TwinSyncSse(hint: hint);

void returnCustomNestedError1Variant1TwinSyncSse({dynamic hint}) =>
    RustLib.instance.api
        .returnCustomNestedError1Variant1TwinSyncSse(hint: hint);

void returnCustomNestedError2TwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.returnCustomNestedError2TwinSyncSse(hint: hint);

void returnCustomStructErrorTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.returnCustomStructErrorTwinSyncSse(hint: hint);

int returnCustomStructOkTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.returnCustomStructOkTwinSyncSse(hint: hint);

void throwAnyhowTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.throwAnyhowTwinSyncSse(hint: hint);

void panicWithCustomResultTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.panicWithCustomResultTwinSyncSse(hint: hint);

Stream<String> streamSinkThrowAnyhowTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.streamSinkThrowAnyhowTwinSyncSse(hint: hint);

@freezed
sealed class CustomEnumErrorTwinSyncSse
    with _$CustomEnumErrorTwinSyncSse
    implements FrbException {
  @Implements<FrbBacktracedException>()
  const factory CustomEnumErrorTwinSyncSse.one({
    required String message,
    required String backtrace,
  }) = CustomEnumErrorTwinSyncSse_One;
  @Implements<FrbBacktracedException>()
  const factory CustomEnumErrorTwinSyncSse.two({
    required int message,
    required String backtrace,
  }) = CustomEnumErrorTwinSyncSse_Two;
}

@freezed
sealed class CustomErrorTwinSyncSse
    with _$CustomErrorTwinSyncSse
    implements FrbException {
  @Implements<FrbBacktracedException>()
  const factory CustomErrorTwinSyncSse.error0({
    required String e,
    required String backtrace,
  }) = CustomErrorTwinSyncSse_Error0;
  @Implements<FrbBacktracedException>()
  const factory CustomErrorTwinSyncSse.error1({
    required int e,
    required String backtrace,
  }) = CustomErrorTwinSyncSse_Error1;
}

@freezed
sealed class CustomNestedError1TwinSyncSse
    with _$CustomNestedError1TwinSyncSse
    implements FrbException {
  const factory CustomNestedError1TwinSyncSse.customNested1(
    String field0,
  ) = CustomNestedError1TwinSyncSse_CustomNested1;
  const factory CustomNestedError1TwinSyncSse.errorNested(
    CustomNestedError2TwinSyncSse field0,
  ) = CustomNestedError1TwinSyncSse_ErrorNested;
}

@freezed
sealed class CustomNestedError2TwinSyncSse
    with _$CustomNestedError2TwinSyncSse {
  const factory CustomNestedError2TwinSyncSse.customNested2(
    String field0,
  ) = CustomNestedError2TwinSyncSse_CustomNested2;
  const factory CustomNestedError2TwinSyncSse.customNested2Number(
    int field0,
  ) = CustomNestedError2TwinSyncSse_CustomNested2Number;
}

@freezed
sealed class CustomNestedErrorInnerTwinSyncSse
    with _$CustomNestedErrorInnerTwinSyncSse {
  const factory CustomNestedErrorInnerTwinSyncSse.three(
    String field0,
  ) = CustomNestedErrorInnerTwinSyncSse_Three;
  const factory CustomNestedErrorInnerTwinSyncSse.four(
    int field0,
  ) = CustomNestedErrorInnerTwinSyncSse_Four;
}

@freezed
sealed class CustomNestedErrorOuterTwinSyncSse
    with _$CustomNestedErrorOuterTwinSyncSse {
  const factory CustomNestedErrorOuterTwinSyncSse.one(
    String field0,
  ) = CustomNestedErrorOuterTwinSyncSse_One;
  const factory CustomNestedErrorOuterTwinSyncSse.two(
    CustomNestedErrorInnerTwinSyncSse field0,
  ) = CustomNestedErrorOuterTwinSyncSse_Two;
}

class CustomStructErrorAnotherTwinSyncSse implements FrbException {
  final String message;

  const CustomStructErrorAnotherTwinSyncSse({
    required this.message,
  });

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomStructErrorAnotherTwinSyncSse &&
          runtimeType == other.runtimeType &&
          message == other.message;
}

class CustomStructErrorTwinSyncSse {
  final String a;

  const CustomStructErrorTwinSyncSse({
    required this.a,
  });

  @override
  int get hashCode => a.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomStructErrorTwinSyncSse &&
          runtimeType == other.runtimeType &&
          a == other.a;
}

class CustomStructTwinSyncSse {
  final String message;

  const CustomStructTwinSyncSse({
    required this.message,
  });

  static CustomStructTwinSyncSse newTwinSyncSse(
          {required String message, dynamic hint}) =>
      RustLib.instance.api
          .customStructTwinSyncSseNewTwinSyncSse(message: message, hint: hint);

  void nonstaticReturnCustomStructErrorTwinSyncSse({dynamic hint}) =>
      RustLib.instance.api
          .customStructTwinSyncSseNonstaticReturnCustomStructErrorTwinSyncSse(
        that: this,
      );

  int nonstaticReturnCustomStructOkTwinSyncSse({dynamic hint}) =>
      RustLib.instance.api
          .customStructTwinSyncSseNonstaticReturnCustomStructOkTwinSyncSse(
        that: this,
      );

  static void staticReturnCustomStructErrorTwinSyncSse({dynamic hint}) =>
      RustLib.instance.api
          .customStructTwinSyncSseStaticReturnCustomStructErrorTwinSyncSse(
              hint: hint);

  static int staticReturnCustomStructOkTwinSyncSse({dynamic hint}) => RustLib
      .instance.api
      .customStructTwinSyncSseStaticReturnCustomStructOkTwinSyncSse(hint: hint);

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomStructTwinSyncSse &&
          runtimeType == other.runtimeType &&
          message == other.message;
}

class SomeStructTwinSyncSse {
  final int value;

  const SomeStructTwinSyncSse({
    required this.value,
  });

  static SomeStructTwinSyncSse newTwinSyncSse(
          {required int value, dynamic hint}) =>
      RustLib.instance.api
          .someStructTwinSyncSseNewTwinSyncSse(value: value, hint: hint);

  int nonStaticReturnErrCustomErrorTwinSyncSse({dynamic hint}) =>
      RustLib.instance.api
          .someStructTwinSyncSseNonStaticReturnErrCustomErrorTwinSyncSse(
        that: this,
      );

  int nonStaticReturnOkCustomErrorTwinSyncSse({dynamic hint}) =>
      RustLib.instance.api
          .someStructTwinSyncSseNonStaticReturnOkCustomErrorTwinSyncSse(
        that: this,
      );

  static int staticReturnErrCustomErrorTwinSyncSse({dynamic hint}) => RustLib
      .instance.api
      .someStructTwinSyncSseStaticReturnErrCustomErrorTwinSyncSse(hint: hint);

  static int staticReturnOkCustomErrorTwinSyncSse({dynamic hint}) => RustLib
      .instance.api
      .someStructTwinSyncSseStaticReturnOkCustomErrorTwinSyncSse(hint: hint);

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SomeStructTwinSyncSse &&
          runtimeType == other.runtimeType &&
          value == other.value;
}
