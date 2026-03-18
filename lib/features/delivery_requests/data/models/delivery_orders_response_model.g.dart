// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_orders_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryOrdersResponseModel _$DeliveryOrdersResponseModelFromJson(
  Map<String, dynamic> json,
) => DeliveryOrdersResponseModel(
  orders: (json['orders'] as List<dynamic>?)
      ?.map((e) => DeliveryOrderModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeliveryOrdersResponseModelToJson(
  DeliveryOrdersResponseModel instance,
) => <String, dynamic>{'orders': instance.orders, 'meta': instance.meta};
