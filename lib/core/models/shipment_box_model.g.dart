// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_box_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentBoxModel _$ShipmentBoxModelFromJson(
  Map<String, dynamic> json,
) => ShipmentBoxModel(
  id: (json['id'] as num?)?.toInt(),
  code: json['code'] as String?,
  tripCode: json['trip_code'] as String?,
  weight: json['weight'] as num?,
  size: json['size'] as num?,
  dimensions: json['dimensions'] == null
      ? null
      : BoxDimensionsModel.fromJson(json['dimensions'] as Map<String, dynamic>),
  status: json['status'] == null
      ? null
      : StatusModel.fromJson(json['status'] as Map<String, dynamic>),
  financialStatus: json['financial_status'] == null
      ? null
      : StatusModel.fromJson(json['financial_status'] as Map<String, dynamic>),
  price: json['price'] as num?,
  discountValue: json['discount_value'] as num?,
  priceAfterDiscount: json['price_after_discount'] as num?,
  boxImage: json['box_image'] as String?,
);

Map<String, dynamic> _$ShipmentBoxModelToJson(ShipmentBoxModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'trip_code': instance.tripCode,
      'weight': instance.weight,
      'size': instance.size,
      'dimensions': instance.dimensions,
      'status': instance.status,
      'financial_status': instance.financialStatus,
      'price': instance.price,
      'discount_value': instance.discountValue,
      'price_after_discount': instance.priceAfterDiscount,
      'box_image': instance.boxImage,
    };
