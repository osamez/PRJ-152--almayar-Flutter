// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_orders_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseOrdersResponseModel _$PurchaseOrdersResponseModelFromJson(
  Map<String, dynamic> json,
) => PurchaseOrdersResponseModel(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => PurchaseOrderModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PurchaseOrdersResponseModelToJson(
  PurchaseOrdersResponseModel instance,
) => <String, dynamic>{'data': instance.data, 'meta': instance.meta};
