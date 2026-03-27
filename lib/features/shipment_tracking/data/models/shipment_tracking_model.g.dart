// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_tracking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentTrackingDataModel _$ShipmentTrackingDataModelFromJson(
  Map<String, dynamic> json,
) => ShipmentTrackingDataModel(
  shipments: (json['shipments'] as List<dynamic>?)
      ?.map((e) => ShipmentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShipmentTrackingDataModelToJson(
  ShipmentTrackingDataModel instance,
) => <String, dynamic>{'shipments': instance.shipments, 'meta': instance.meta};

ShipmentModel _$ShipmentModelFromJson(
  Map<String, dynamic> json,
) => ShipmentModel(
  id: (json['id'] as num?)?.toInt(),
  code: json['code'] as String?,
  userId: (json['user_id'] as num?)?.toInt(),
  userName: json['user_name'] as String?,
  receivingBranch: json['receiving_branch'] as String?,
  receivingCountry: json['receiving_country'] as String?,
  deliveryBranch: json['delivery_branch'] as String?,
  deliveryCountry: json['delivery_country'] as String?,
  status: json['status'] == null
      ? null
      : StatusModel.fromJson(json['status'] as Map<String, dynamic>),
  financialStatus: json['financial_status'] == null
      ? null
      : StatusModel.fromJson(json['financial_status'] as Map<String, dynamic>),
  flightType: json['flight_type'] as String?,
  shipmentType: json['shipment_type'] as String?,
  contentName: json['content_name'] as String?,
  categoryName: json['category_name'] as String?,
  boxesCount: (json['boxes_count'] as num?)?.toInt(),
  supplierPhone: json['supplier_phone'] as String?,
  pricePerCbm: json['price_per_cbm'] as num?,
  pricePerKg: json['price_per_kg'] as num?,
  extraPrice: json['extra_price'] as num?,
  discountPrice: json['discount_price'] as num?,
  companiesDiscountValue: json['companies_discount_value'] as num?,
  totalDiscounts: json['total_discounts'] as num?,
  shipmentPriceBeforeDiscount: json['shipment_price_before_discount'] as num?,
  totalPrice: json['total_price'] as num?,
  totalWeight: json['total_weight'] as num?,
  totalSize: json['total_size'] as num?,
  trackingNumber: json['tracking_number'] as String?,
  receivingDate: json['receiving_date'] as String?,
  createdAt: json['created_at'] as String?,
  shipmentImages: (json['shipment_images'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  customsFiles: (json['customs_files'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  boxes: (json['boxes'] as List<dynamic>?)
      ?.map((e) => ShipmentBoxModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  shipmentWay: json['shipment_way'] == null
      ? null
      : ShipmentWayModel.fromJson(json['shipment_way'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShipmentModelToJson(ShipmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'receiving_branch': instance.receivingBranch,
      'receiving_country': instance.receivingCountry,
      'delivery_branch': instance.deliveryBranch,
      'delivery_country': instance.deliveryCountry,
      'status': instance.status,
      'financial_status': instance.financialStatus,
      'flight_type': instance.flightType,
      'shipment_type': instance.shipmentType,
      'content_name': instance.contentName,
      'category_name': instance.categoryName,
      'boxes_count': instance.boxesCount,
      'supplier_phone': instance.supplierPhone,
      'price_per_cbm': instance.pricePerCbm,
      'price_per_kg': instance.pricePerKg,
      'extra_price': instance.extraPrice,
      'discount_price': instance.discountPrice,
      'companies_discount_value': instance.companiesDiscountValue,
      'total_discounts': instance.totalDiscounts,
      'shipment_price_before_discount': instance.shipmentPriceBeforeDiscount,
      'total_price': instance.totalPrice,
      'total_weight': instance.totalWeight,
      'total_size': instance.totalSize,
      'tracking_number': instance.trackingNumber,
      'receiving_date': instance.receivingDate,
      'created_at': instance.createdAt,
      'shipment_images': instance.shipmentImages,
      'customs_files': instance.customsFiles,
      'boxes': instance.boxes,
      'shipment_way': instance.shipmentWay,
    };
