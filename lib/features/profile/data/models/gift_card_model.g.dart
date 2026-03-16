// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftCardModel _$GiftCardModelFromJson(Map<String, dynamic> json) =>
    GiftCardModel(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      value: (json['value'] as num?)?.toDouble(),
      valueUsed: (json['value_used'] as num?)?.toDouble(),
      remainingValue: (json['remaining_value'] as num?)?.toDouble(),
      expiryDate: json['expiry_date'] as String?,
      isUsed: json['is_used'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$GiftCardModelToJson(GiftCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'value': instance.value,
      'value_used': instance.valueUsed,
      'remaining_value': instance.remainingValue,
      'expiry_date': instance.expiryDate,
      'is_used': instance.isUsed,
      'notes': instance.notes,
    };
