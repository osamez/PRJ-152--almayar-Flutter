// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dimensions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DimensionsModel _$DimensionsModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DimensionsModel', json, ($checkedConvert) {
      final val = DimensionsModel(
        height: $checkedConvert(
          'height',
          (v) => const NullableStringConverter().fromJson(v),
        ),
        width: $checkedConvert(
          'width',
          (v) => const NullableStringConverter().fromJson(v),
        ),
        length: $checkedConvert(
          'length',
          (v) => const NullableStringConverter().fromJson(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DimensionsModelToJson(DimensionsModel instance) =>
    <String, dynamic>{
      'height': const NullableStringConverter().toJson(instance.height),
      'width': const NullableStringConverter().toJson(instance.width),
      'length': const NullableStringConverter().toJson(instance.length),
    };
