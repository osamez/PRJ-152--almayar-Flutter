import 'package:json_annotation/json_annotation.dart';

part 'price_calculator_response_model.g.dart';

@JsonSerializable()
class PriceCalculatorResponseModel {
  @JsonKey(name: 'price_per_unit')
  final double pricePerUnit;
  @JsonKey(name: 'estimated_price')
  final double estimatedPrice;

  const PriceCalculatorResponseModel({
    required this.pricePerUnit,
    required this.estimatedPrice,
  });

  factory PriceCalculatorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PriceCalculatorResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PriceCalculatorResponseModelToJson(this);
}
