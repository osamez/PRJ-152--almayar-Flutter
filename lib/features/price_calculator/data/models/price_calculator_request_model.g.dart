// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_calculator_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceCalculatorRequestModel _$PriceCalculatorRequestModelFromJson(
  Map<String, dynamic> json,
) => PriceCalculatorRequestModel(
  receivingBranchId: json['receiving_branch_id'] as String,
  shipmentType: json['shipment_type'] as String,
  flightType: json['flight_type'] as String,
  categoryId: json['category_id'] as String,
  weight: json['weight'] as String,
  size: json['size'] as String,
  deliveryBranchId: json['delivery_branch_id'] as String,
  shipmentContentId: json['shipment_content_id'] as String,
);

Map<String, dynamic> _$PriceCalculatorRequestModelToJson(
  PriceCalculatorRequestModel instance,
) => <String, dynamic>{
  'receiving_branch_id': instance.receivingBranchId,
  'shipment_type': instance.shipmentType,
  'flight_type': instance.flightType,
  'category_id': instance.categoryId,
  'weight': instance.weight,
  'size': instance.size,
  'delivery_branch_id': instance.deliveryBranchId,
  'shipment_content_id': instance.shipmentContentId,
};
