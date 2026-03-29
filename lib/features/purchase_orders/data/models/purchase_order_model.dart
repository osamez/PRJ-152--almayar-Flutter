import 'package:almeyar/core/models/status_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/shopping_site_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/wallet_currency_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'purchase_order_model.g.dart';

@JsonSerializable()
class PurchaseOrderModel {
  final int? id;
  final String? code;
  @JsonKey(name: 'shopping_site')
  final ShoppingSiteModel? shoppingSite;
  @JsonKey(name: 'payment_link')
  final String? paymentLink;
  @JsonKey(name: 'amount_usd')
  final num? amountUsd;
  @JsonKey(name: 'wallet_currency')
  final WalletCurrencyModel? walletCurrency;
  @JsonKey(name: 'purchase_date')
  final String? purchaseDate;
  @JsonKey(name: 'order_value')
  final num? orderValue;
  @JsonKey(name: 'paid_amount')
  final num? paidAmount;
  final StatusModel? status;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  final String? notes;
  final String? attachment;

  const PurchaseOrderModel({
    this.id,
    this.code,
    this.shoppingSite,
    this.paymentLink,
    this.amountUsd,
    this.walletCurrency,
    this.purchaseDate,
    this.orderValue,
    this.paidAmount,
    this.status,
    this.createdAt,
    this.notes,
    this.attachment,
  });

  factory PurchaseOrderModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseOrderModelToJson(this);
}
