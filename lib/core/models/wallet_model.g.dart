// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) => WalletModel(
  id: (json['id'] as num?)?.toInt(),
  walletName: json['wallet_name'] as String?,
  amount: json['amount'] as num?,
  currencyName: json['currency_name'] as String?,
  currencyCode: json['currency_code'] as String?,
  currency: json['currency'] == null
      ? null
      : Currency.fromJson(json['currency'] as Map<String, dynamic>),
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$WalletModelToJson(WalletModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wallet_name': instance.walletName,
      'amount': instance.amount,
      'currency_name': instance.currencyName,
      'currency_code': instance.currencyCode,
      'currency': instance.currency,
      'created_at': instance.createdAt,
    };

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  code: json['code'] as String?,
);

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
};
