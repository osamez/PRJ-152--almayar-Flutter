import 'package:almeyar/core/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivery_order_model.g.dart';

@JsonSerializable()
class DeliveryOrderModel {
  final int? id;
  final String? code;
  @JsonKey(name: 'delivery_branch')
  final String? deliveryBranch;
  final String? delegate;
  @JsonKey(name: 'boxes_count')
  final int? boxesCount;
  final StatusModel? status;
  @JsonKey(name: 'financial_status')
  final StatusModel? financialStatus;
  final String? type;
  final String? address;
  @JsonKey(name: 'delivery_date')
  final String? deliveryDate;
  @JsonKey(name: 'delivery_price')
  final double? deliveryPrice;
  @JsonKey(name: 'total_price')
  final double? totalPrice;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const DeliveryOrderModel({
    this.id,
    this.code,
    this.deliveryBranch,
    this.delegate,
    this.boxesCount,
    this.status,
    this.financialStatus,
    this.type,
    this.address,
    this.deliveryDate,
    this.deliveryPrice,
    this.totalPrice,
    this.createdAt,
  });

  factory DeliveryOrderModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryOrderModelToJson(this);
}
