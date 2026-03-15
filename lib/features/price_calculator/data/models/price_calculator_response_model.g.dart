// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_calculator_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceCalculatorResponseModel _$PriceCalculatorResponseModelFromJson(
  Map<String, dynamic> json,
) => PriceCalculatorResponseModel(
  pricePerUnit: (json['price_per_unit'] as num).toDouble(),
  estimatedPrice: (json['estimated_price'] as num).toDouble(),
);

Map<String, dynamic> _$PriceCalculatorResponseModelToJson(
  PriceCalculatorResponseModel instance,
) => <String, dynamic>{
  'price_per_unit': instance.pricePerUnit,
  'estimated_price': instance.estimatedPrice,
};
