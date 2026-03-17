// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryOrderDetailsModel _$DeliveryOrderDetailsModelFromJson(
  Map<String, dynamic> json,
) => DeliveryOrderDetailsModel(
  id: (json['id'] as num?)?.toInt(),
  code: json['code'] as String?,
  status: json['status'] == null
      ? null
      : StatusModel.fromJson(json['status'] as Map<String, dynamic>),
  deliveryBranch: json['delivery_branch'] as String?,
  delegate: json['delegate'] as String?,
  financialStatus: json['financial_status'] == null
      ? null
      : StatusModel.fromJson(json['financial_status'] as Map<String, dynamic>),
  type: json['type'] as String?,
  deliveryDate: json['delivery_date'] as String?,
  deliveryPrice: (json['delivery_price'] as num?)?.toDouble(),
  address: json['address'] as String?,
  reasonRefuse: json['reason_refuse'] as String?,
  failedDeliveryReason: json['failed_delivery_reason'] as String?,
  invoice: json['invoice'] == null
      ? null
      : InvoiceModel.fromJson(json['invoice'] as Map<String, dynamic>),
  boxes: (json['boxes'] as List<dynamic>?)
      ?.map((e) => BoxModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$DeliveryOrderDetailsModelToJson(
  DeliveryOrderDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'status': instance.status,
  'delivery_branch': instance.deliveryBranch,
  'delegate': instance.delegate,
  'financial_status': instance.financialStatus,
  'type': instance.type,
  'delivery_date': instance.deliveryDate,
  'delivery_price': instance.deliveryPrice,
  'address': instance.address,
  'reason_refuse': instance.reasonRefuse,
  'failed_delivery_reason': instance.failedDeliveryReason,
  'invoice': instance.invoice,
  'boxes': instance.boxes,
  'created_at': instance.createdAt,
};
