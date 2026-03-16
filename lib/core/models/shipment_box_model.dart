import 'package:almeyar/core/models/box_dimensions_model.dart';
import 'package:almeyar/core/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipment_box_model.g.dart';

@JsonSerializable()
class ShipmentBoxModel {
  final int? id;
  final String? code;
  @JsonKey(name: 'trip_code')
  final String? tripCode;
  final num? weight;
  final num? size;
  final BoxDimensionsModel? dimensions;
  final StatusModel? status;
  @JsonKey(name: 'financial_status')
  final StatusModel? financialStatus;
  final num? price;
  @JsonKey(name: 'discount_value')
  final num? discountValue;
  @JsonKey(name: 'price_after_discount')
  final num? priceAfterDiscount;
  @JsonKey(name: 'box_image')
  final String? boxImage;

  const ShipmentBoxModel({
    this.id,
    this.code,
    this.tripCode,
    this.weight,
    this.size,
    this.dimensions,
    this.status,
    this.financialStatus,
    this.price,
    this.discountValue,
    this.priceAfterDiscount,
    this.boxImage,
  });

  factory ShipmentBoxModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentBoxModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentBoxModelToJson(this);
}
