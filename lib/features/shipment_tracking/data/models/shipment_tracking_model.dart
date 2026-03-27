import 'package:almeyar/core/models/meta_model.dart';
import 'package:almeyar/core/models/status_model.dart';
import 'package:almeyar/core/models/shipment_box_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../pickup_request/data/models/shipment_request_model.dart';

part 'shipment_tracking_model.g.dart';

@JsonSerializable()
class ShipmentTrackingDataModel {
  final List<ShipmentModel>? shipments;
  final MetaModel? meta;

  const ShipmentTrackingDataModel({this.shipments, this.meta});

  factory ShipmentTrackingDataModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentTrackingDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentTrackingDataModelToJson(this);
}

@JsonSerializable()
class ShipmentModel {
  final int? id;
  final String? code;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'user_name')
  final String? userName;
  @JsonKey(name: 'receiving_branch')
  final String? receivingBranch;
  @JsonKey(name: 'receiving_country')
  final String? receivingCountry;
  @JsonKey(name: 'delivery_branch')
  final String? deliveryBranch;
  @JsonKey(name: 'delivery_country')
  final String? deliveryCountry;
  final StatusModel? status;
  @JsonKey(name: 'financial_status')
  final StatusModel? financialStatus;
  @JsonKey(name: 'flight_type')
  final String? flightType;
  @JsonKey(name: 'shipment_type')
  final String? shipmentType;
  @JsonKey(name: 'content_name')
  final String? contentName;
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @JsonKey(name: 'boxes_count')
  final int? boxesCount;
  @JsonKey(name: 'supplier_phone')
  final String? supplierPhone;
  @JsonKey(name: 'price_per_cbm')
  final num? pricePerCbm;
  @JsonKey(name: 'price_per_kg')
  final num? pricePerKg;
  @JsonKey(name: 'extra_price')
  final num? extraPrice;
  @JsonKey(name: 'discount_price')
  final num? discountPrice;
  @JsonKey(name: 'companies_discount_value')
  final num? companiesDiscountValue;
  @JsonKey(name: 'total_discounts')
  final num? totalDiscounts;
  @JsonKey(name: 'shipment_price_before_discount')
  final num? shipmentPriceBeforeDiscount;
  @JsonKey(name: 'total_price')
  final num? totalPrice;
  @JsonKey(name: 'total_weight')
  final num? totalWeight;
  @JsonKey(name: 'total_size')
  final num? totalSize;
  @JsonKey(name: 'tracking_number')
  final String? trackingNumber;
  @JsonKey(name: 'receiving_date')
  final String? receivingDate;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'shipment_images')
  final List<String>? shipmentImages;
  @JsonKey(name: 'customs_files')
  final List<String>? customsFiles;
  final List<ShipmentBoxModel>? boxes;
  @JsonKey(name: 'shipment_way')
  final ShipmentWayModel? shipmentWay;

  const ShipmentModel({
    this.id,
    this.code,
    this.userId,
    this.userName,
    this.receivingBranch,
    this.receivingCountry,
    this.deliveryBranch,
    this.deliveryCountry,
    this.status,
    this.financialStatus,
    this.flightType,
    this.shipmentType,
    this.contentName,
    this.categoryName,
    this.boxesCount,
    this.supplierPhone,
    this.pricePerCbm,
    this.pricePerKg,
    this.extraPrice,
    this.discountPrice,
    this.companiesDiscountValue,
    this.totalDiscounts,
    this.shipmentPriceBeforeDiscount,
    this.totalPrice,
    this.totalWeight,
    this.totalSize,
    this.trackingNumber,
    this.receivingDate,
    this.createdAt,
    this.shipmentImages,
    this.customsFiles,
    this.boxes,
    this.shipmentWay,
  });

  factory ShipmentModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentModelToJson(this);
}
