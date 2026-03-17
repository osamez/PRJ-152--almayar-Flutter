// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_purchase_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPurchaseRequestModel _$AddPurchaseRequestModelFromJson(
  Map<String, dynamic> json,
) => AddPurchaseRequestModel(
  shoppingSiteId: json['shopping_site_id'] as String?,
  paymentLink: json['payment_link'] as String?,
  amountUsd: json['amount_usd'] as String?,
  walletCurrencyId: json['wallet_currency_id'] as String?,
);

Map<String, dynamic> _$AddPurchaseRequestModelToJson(
  AddPurchaseRequestModel instance,
) => <String, dynamic>{
  'shopping_site_id': instance.shoppingSiteId,
  'payment_link': instance.paymentLink,
  'amount_usd': instance.amountUsd,
  'wallet_currency_id': instance.walletCurrencyId,
};
