import 'package:almeyar/core/helpers/helper_func.dart';
import 'package:almeyar/core/models/status_model.dart';
import 'package:almeyar/features/delivery_requests/data/models/dimensions_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'box_model.g.dart';

@JsonSerializable(checked: true)
class BoxModel {
  final int? id;
  final String? code;
  @JsonKey(name: 'shipment_code')
  final String? shipmentCode;
  @JsonKey(name: 'receiving_branch')
  final String? receivingBranch;
  @JsonKey(name: 'trip_code')
  final String? tripCode;
  @NullableStringConverter()
  final String? weight;
  final DimensionsModel? dimensions;
  @NullableStringConverter()
  final String? size;
  @NullableStringConverter()
  final String? price;
  @JsonKey(name: 'price_after_discount')
  @NullableStringConverter()
  final String? priceAfterDiscount;
  final StatusModel? status;
  @JsonKey(name: 'financial_status')
  final StatusModel? financialStatus;
  @JsonKey(name: 'delivery_date')
  final String? deliveryDate;
  @JsonKey(name: 'discount_value')
  @NullableStringConverter()
  final String? discountValue;
  @JsonKey(name: 'box_image')
  @NullableStringConverter()
  final String? boxImage;
  @JsonKey(name: 'shipment_type')
  final BoxShipmentType? shipmentType;

  const BoxModel({
    this.id,
    this.code,
    this.shipmentCode,
    this.receivingBranch,
    this.tripCode,
    this.weight,
    this.dimensions,
    this.shipmentType,
    this.size,
    this.price,
    this.priceAfterDiscount,
    this.status,
    this.financialStatus,
    this.deliveryDate,
    this.discountValue,
    this.boxImage,
  });

  factory BoxModel.fromJson(Map<String, dynamic> json) =>
      _$BoxModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoxModelToJson(this);
}

@JsonSerializable(checked: true)
class BoxShipmentType {
  final int? id;
  final String? name;

  BoxShipmentType({this.id, this.name});

  factory BoxShipmentType.fromJson(Map<String, dynamic> json) =>
      _$BoxShipmentTypeFromJson(json);

  Map<String, dynamic> toJson() => _$BoxShipmentTypeToJson(this);
}
