// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_transfer_currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoneyTransferCurrencyModel _$MoneyTransferCurrencyModelFromJson(
  Map<String, dynamic> json,
) => MoneyTransferCurrencyModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  code: json['code'] as String?,
);

Map<String, dynamic> _$MoneyTransferCurrencyModelToJson(
  MoneyTransferCurrencyModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
};
