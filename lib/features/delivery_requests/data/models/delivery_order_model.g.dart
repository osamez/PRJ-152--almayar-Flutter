// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryOrderModel _$DeliveryOrderModelFromJson(Map<String, dynamic> json) =>
    DeliveryOrderModel(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      deliveryBranch: json['delivery_branch'] as String?,
      delegate: json['delegate'] as String?,
      boxesCount: (json['boxes_count'] as num?)?.toInt(),
      status: json['status'] == null
          ? null
          : StatusModel.fromJson(json['status'] as Map<String, dynamic>),
      financialStatus: json['financial_status'] == null
          ? null
          : StatusModel.fromJson(
              json['financial_status'] as Map<String, dynamic>,
            ),
      type: json['type'] as String?,
      address: json['address'] as String?,
      deliveryDate: json['delivery_date'] as String?,
      deliveryPrice: (json['delivery_price'] as num?)?.toDouble(),
      totalPrice: (json['total_price'] as num?)?.toDouble(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$DeliveryOrderModelToJson(DeliveryOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'delivery_branch': instance.deliveryBranch,
      'delegate': instance.delegate,
      'boxes_count': instance.boxesCount,
      'status': instance.status,
      'financial_status': instance.financialStatus,
      'type': instance.type,
      'address': instance.address,
      'delivery_date': instance.deliveryDate,
      'delivery_price': instance.deliveryPrice,
      'total_price': instance.totalPrice,
      'created_at': instance.createdAt,
    };
