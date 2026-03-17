import 'package:json_annotation/json_annotation.dart';

part 'add_purchase_request_model.g.dart';

@JsonSerializable()
class AddPurchaseRequestModel {
  @JsonKey(name: 'shopping_site_id')
  final String? shoppingSiteId;
  @JsonKey(name: 'payment_link')
  final String? paymentLink;
  @JsonKey(name: 'amount_usd')
  final String? amountUsd;
  @JsonKey(name: 'wallet_currency_id')
  final String? walletCurrencyId;

  const AddPurchaseRequestModel({
    this.shoppingSiteId,
    this.paymentLink,
    this.amountUsd,
    this.walletCurrencyId,
  });

  factory AddPurchaseRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddPurchaseRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddPurchaseRequestModelToJson(this);
}
