// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseOrderModel _$PurchaseOrderModelFromJson(Map<String, dynamic> json) =>
    PurchaseOrderModel(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      shoppingSite: json['shopping_site'] == null
          ? null
          : ShoppingSiteModel.fromJson(
              json['shopping_site'] as Map<String, dynamic>,
            ),
      paymentLink: json['payment_link'] as String?,
      amountUsd: json['amount_usd'] as num?,
      walletCurrency: json['wallet_currency'] == null
          ? null
          : WalletCurrencyModel.fromJson(
              json['wallet_currency'] as Map<String, dynamic>,
            ),
      purchaseDate: json['purchase_date'] as String?,
      orderValue: json['order_value'] as num?,
      paidAmount: json['paid_amount'] as num?,
      status: json['status'] == null
          ? null
          : StatusModel.fromJson(json['status'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$PurchaseOrderModelToJson(PurchaseOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'shopping_site': instance.shoppingSite,
      'payment_link': instance.paymentLink,
      'amount_usd': instance.amountUsd,
      'wallet_currency': instance.walletCurrency,
      'purchase_date': instance.purchaseDate,
      'order_value': instance.orderValue,
      'paid_amount': instance.paidAmount,
      'status': instance.status,
      'created_at': instance.createdAt,
      'notes': instance.notes,
    };
