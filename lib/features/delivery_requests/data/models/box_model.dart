import 'package:almeyar/core/models/status_model.dart';
import 'package:almeyar/features/delivery_requests/data/models/dimensions_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'box_model.g.dart';

@JsonSerializable()
class BoxModel {
  final int? id;
  final String? code;
  @JsonKey(name: 'shipment_code')
  final String? shipmentCode;
  @JsonKey(name: 'receiving_branch')
  final String? receivingBranch;
  @JsonKey(name: 'trip_code')
  final String? tripCode;
  final String? weight;
  final DimensionsModel? dimensions;
  final String? size;
  final String? price;
  @JsonKey(name: 'price_after_discount')
  final String? priceAfterDiscount;
  final StatusModel? status;
  @JsonKey(name: 'financial_status')
  final StatusModel? financialStatus;
  @JsonKey(name: 'delivery_date')
  final String? deliveryDate;

  const BoxModel({
    this.id,
    this.code,
    this.shipmentCode,
    this.receivingBranch,
    this.tripCode,
    this.weight,
    this.dimensions,
    this.size,
    this.price,
    this.priceAfterDiscount,
    this.status,
    this.financialStatus,
    this.deliveryDate,
  });

  factory BoxModel.fromJson(Map<String, dynamic> json) =>
      _$BoxModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoxModelToJson(this);
}
