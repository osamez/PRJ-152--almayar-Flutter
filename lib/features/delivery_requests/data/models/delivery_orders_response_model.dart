import 'package:almeyar/core/models/meta_model.dart';
import 'package:almeyar/features/delivery_requests/data/models/delivery_order_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivery_orders_response_model.g.dart';

@JsonSerializable()
class DeliveryOrdersResponseModel {
  final List<DeliveryOrderModel>? orders;
  final MetaModel? meta;

  const DeliveryOrdersResponseModel({this.orders, this.meta});

  factory DeliveryOrdersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrdersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryOrdersResponseModelToJson(this);
}
