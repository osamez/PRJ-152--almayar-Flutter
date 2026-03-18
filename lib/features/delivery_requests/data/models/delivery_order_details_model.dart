import 'package:almeyar/core/models/status_model.dart';
import 'package:almeyar/features/delivery_requests/data/models/box_model.dart';
import 'package:almeyar/features/delivery_requests/data/models/invoice_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivery_order_details_model.g.dart';

@JsonSerializable()
class DeliveryOrderDetailsModel {
  final int? id;
  final String? code;
  final StatusModel? status;
  @JsonKey(name: 'delivery_branch')
  final String? deliveryBranch;
  final String? delegate;
  @JsonKey(name: 'financial_status')
  final StatusModel? financialStatus;
  final String? type;
  @JsonKey(name: 'delivery_date')
  final String? deliveryDate;
  @JsonKey(name: 'delivery_price')
  final double? deliveryPrice;
  final String? address;
  @JsonKey(name: 'reason_refuse')
  final String? reasonRefuse;
  @JsonKey(name: 'failed_delivery_reason')
  final String? failedDeliveryReason;
  final InvoiceModel? invoice;
  final List<BoxModel>? boxes;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const DeliveryOrderDetailsModel({
    this.id,
    this.code,
    this.status,
    this.deliveryBranch,
    this.delegate,
    this.financialStatus,
    this.type,
    this.deliveryDate,
    this.deliveryPrice,
    this.address,
    this.reasonRefuse,
    this.failedDeliveryReason,
    this.invoice,
    this.boxes,
    this.createdAt,
  });

  factory DeliveryOrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrderDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryOrderDetailsModelToJson(this);
}
