// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletCurrencyModel _$WalletCurrencyModelFromJson(Map<String, dynamic> json) =>
    WalletCurrencyModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
    );

Map<String, dynamic> _$WalletCurrencyModelToJson(
  WalletCurrencyModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'symbol': instance.symbol,
};
