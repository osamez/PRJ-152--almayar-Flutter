// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentRequestsDataModel _$ShipmentRequestsDataModelFromJson(
  Map<String, dynamic> json,
) => ShipmentRequestsDataModel(
  requests: (json['requests'] as List<dynamic>?)
      ?.map((e) => ShipmentRequestModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShipmentRequestsDataModelToJson(
  ShipmentRequestsDataModel instance,
) => <String, dynamic>{'requests': instance.requests, 'meta': instance.meta};

ShipmentRequestModel _$ShipmentRequestModelFromJson(
  Map<String, dynamic> json,
) => ShipmentRequestModel(
  id: (json['id'] as num?)?.toInt(),
  shipmentType: json['shipment_type'] as String?,
  flightType: json['flight_type'] as String?,
  shipmentWay: json['shipment_way'] as String?,
  receivingBranch: json['receiving_branch'] as String?,
  deliveryBranch: json['delivery_branch'] as String?,
  shipmentContent: json['shipment_content'] as String?,
  category: json['category'] as String?,
  boxesCount: (json['boxes_count'] as num?)?.toInt(),
  totalWeight: json['total_weight'] as String?,
  totalSize: const NullableStringConverter().fromJson(json['total_size']),
  trackingNumber: json['tracking_number'] as String?,
  supplierPhone: json['supplier_phone'] as String?,
  supplierPhoneCode: json['supplier_phone_code'] as String?,
  inspectionRequest: json['inspection_request'] as bool?,
  inspectionNote: json['inspection_note'] as String?,
  status: json['status'] == null
      ? null
      : StatusModel.fromJson(json['status'] as Map<String, dynamic>),
  pricePerUnit: json['price_per_unit'] as num?,
  estimatedPrice: json['estimated_price'] as num?,
  shipmentImages: (json['shipment_images'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  documentImages: (json['document_images'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  createdAt: json['created_at'] as String?,
  code: const NullableStringConverter().fromJson(json['code']),
  receivingCountry: json['receiving_country'] as String?,
  deliveryCountry: json['delivery_country'] as String?,
);

Map<String, dynamic> _$ShipmentRequestModelToJson(
  ShipmentRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'shipment_type': instance.shipmentType,
  'flight_type': instance.flightType,
  'shipment_way': instance.shipmentWay,
  'receiving_branch': instance.receivingBranch,
  'receiving_country': instance.receivingCountry,
  'delivery_branch': instance.deliveryBranch,
  'code': const NullableStringConverter().toJson(instance.code),
  'delivery_country': instance.deliveryCountry,
  'shipment_content': instance.shipmentContent,
  'category': instance.category,
  'boxes_count': instance.boxesCount,
  'total_weight': instance.totalWeight,
  'total_size': const NullableStringConverter().toJson(instance.totalSize),
  'tracking_number': instance.trackingNumber,
  'supplier_phone': instance.supplierPhone,
  'supplier_phone_code': instance.supplierPhoneCode,
  'inspection_request': instance.inspectionRequest,
  'inspection_note': instance.inspectionNote,
  'status': instance.status,
  'price_per_unit': instance.pricePerUnit,
  'estimated_price': instance.estimatedPrice,
  'shipment_images': instance.shipmentImages,
  'document_images': instance.documentImages,
  'created_at': instance.createdAt,
};
