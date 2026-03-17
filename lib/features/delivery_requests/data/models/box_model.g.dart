// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoxModel _$BoxModelFromJson(Map<String, dynamic> json) => BoxModel(
  id: (json['id'] as num?)?.toInt(),
  code: json['code'] as String?,
  shipmentCode: json['shipment_code'] as String?,
  receivingBranch: json['receiving_branch'] as String?,
  tripCode: json['trip_code'] as String?,
  weight: json['weight'] as String?,
  dimensions: json['dimensions'] == null
      ? null
      : DimensionsModel.fromJson(json['dimensions'] as Map<String, dynamic>),
  size: json['size'] as String?,
  price: json['price'] as String?,
  priceAfterDiscount: json['price_after_discount'] as String?,
  status: json['status'] == null
      ? null
      : StatusModel.fromJson(json['status'] as Map<String, dynamic>),
  financialStatus: json['financial_status'] == null
      ? null
      : StatusModel.fromJson(json['financial_status'] as Map<String, dynamic>),
  deliveryDate: json['delivery_date'] as String?,
);

Map<String, dynamic> _$BoxModelToJson(BoxModel instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'shipment_code': instance.shipmentCode,
  'receiving_branch': instance.receivingBranch,
  'trip_code': instance.tripCode,
  'weight': instance.weight,
  'dimensions': instance.dimensions,
  'size': instance.size,
  'price': instance.price,
  'price_after_discount': instance.priceAfterDiscount,
  'status': instance.status,
  'financial_status': instance.financialStatus,
  'delivery_date': instance.deliveryDate,
};
