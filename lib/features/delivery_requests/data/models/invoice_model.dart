import 'package:json_annotation/json_annotation.dart';

part 'invoice_model.g.dart';

@JsonSerializable()
class InvoiceModel {
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @JsonKey(name: 'currency_used_payment')
  final String? currencyUsedPayment;
  @JsonKey(name: 'total_price_boxes')
  final double? totalPriceBoxes;
  @JsonKey(name: 'plan_discount_value')
  final String? planDiscountValue;
  @JsonKey(name: 'administrative_discount')
  final String? administrativeDiscount;
  @JsonKey(name: 'coupon_discount_value')
  final String? couponDiscountValue;
  @JsonKey(name: 'gift_card_discount_value')
  final String? giftCardDiscountValue;
  @JsonKey(name: 'total_discount')
  final String? totalDiscount;
  @JsonKey(name: 'sub_price')
  final double? subPrice;
  @JsonKey(name: 'total_price')
  final double? totalPrice;
  @JsonKey(name: 'amount_paid_dollar')
  final String? amountPaidDollar;
  @JsonKey(name: 'amount_paid_dinar')
  final String? amountPaidDinar;
  @JsonKey(name: 'delivery_cash_taken')
  final int? deliveryCashTaken;
  @JsonKey(name: 'delivery_price')
  final double? deliveryPrice;

  const InvoiceModel({
    this.paymentMethod,
    this.currencyUsedPayment,
    this.totalPriceBoxes,
    this.planDiscountValue,
    this.administrativeDiscount,
    this.couponDiscountValue,
    this.giftCardDiscountValue,
    this.totalDiscount,
    this.subPrice,
    this.totalPrice,
    this.amountPaidDollar,
    this.amountPaidDinar,
    this.deliveryCashTaken,
    this.deliveryPrice,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceModelToJson(this);
}
