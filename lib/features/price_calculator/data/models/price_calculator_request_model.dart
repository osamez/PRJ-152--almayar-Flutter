import 'package:json_annotation/json_annotation.dart';

part 'price_calculator_request_model.g.dart';

@JsonSerializable()
class PriceCalculatorRequestModel {
  @JsonKey(name: 'receiving_branch_id')
  final String receivingBranchId;
  @JsonKey(name: 'shipment_type')
  final String shipmentType;
  @JsonKey(name: 'flight_type')
  final String flightType;
  @JsonKey(name: 'category_id')
  final String categoryId;
  final String weight;
  final String size;
  @JsonKey(name: 'delivery_branch_id')
  final String deliveryBranchId;
  @JsonKey(name: 'shipment_content_id')
  final String shipmentContentId;

  const PriceCalculatorRequestModel({
    required this.receivingBranchId,
    required this.shipmentType,
    required this.flightType,
    required this.categoryId,
    required this.weight,
    required this.size,
    required this.deliveryBranchId,
    required this.shipmentContentId,
  });

  factory PriceCalculatorRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PriceCalculatorRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PriceCalculatorRequestModelToJson(this);
}
