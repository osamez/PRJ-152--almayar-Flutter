// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) => InvoiceModel(
  paymentMethod: json['payment_method'] as String?,
  currencyUsedPayment: json['currency_used_payment'] as String?,
  totalPriceBoxes: (json['total_price_boxes'] as num?)?.toDouble(),
  planDiscountValue: json['plan_discount_value'] as String?,
  administrativeDiscount: json['administrative_discount'] as String?,
  couponDiscountValue: json['coupon_discount_value'] as String?,
  giftCardDiscountValue: json['gift_card_discount_value'] as String?,
  totalDiscount: json['total_discount'] as String?,
  subPrice: (json['sub_price'] as num?)?.toDouble(),
  totalPrice: (json['total_price'] as num?)?.toDouble(),
  amountPaidDollar: json['amount_paid_dollar'] as String?,
  amountPaidDinar: json['amount_paid_dinar'] as String?,
  deliveryCashTaken: (json['delivery_cash_taken'] as num?)?.toInt(),
  deliveryPrice: (json['delivery_price'] as num?)?.toDouble(),
);

Map<String, dynamic> _$InvoiceModelToJson(InvoiceModel instance) =>
    <String, dynamic>{
      'payment_method': instance.paymentMethod,
      'currency_used_payment': instance.currencyUsedPayment,
      'total_price_boxes': instance.totalPriceBoxes,
      'plan_discount_value': instance.planDiscountValue,
      'administrative_discount': instance.administrativeDiscount,
      'coupon_discount_value': instance.couponDiscountValue,
      'gift_card_discount_value': instance.giftCardDiscountValue,
      'total_discount': instance.totalDiscount,
      'sub_price': instance.subPrice,
      'total_price': instance.totalPrice,
      'amount_paid_dollar': instance.amountPaidDollar,
      'amount_paid_dinar': instance.amountPaidDinar,
      'delivery_cash_taken': instance.deliveryCashTaken,
      'delivery_price': instance.deliveryPrice,
    };
