import 'package:almeyar/core/models/meta_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/purchase_order_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'purchase_orders_response_model.g.dart';

@JsonSerializable()
class PurchaseOrdersResponseModel {
  final List<PurchaseOrderModel>? data;
  final MetaModel? meta;

  const PurchaseOrdersResponseModel({this.data, this.meta});

  factory PurchaseOrdersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrdersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseOrdersResponseModelToJson(this);
}
