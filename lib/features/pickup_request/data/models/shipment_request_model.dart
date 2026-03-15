import 'package:almeyar/core/helpers/helper_func.dart';
import 'package:almeyar/core/models/meta_model.dart';
import 'package:almeyar/core/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipment_request_model.g.dart';

@JsonSerializable()
class ShipmentRequestsDataModel {
  final List<ShipmentRequestModel>? requests;
  final MetaModel? meta;

  const ShipmentRequestsDataModel({this.requests, this.meta});

  factory ShipmentRequestsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentRequestsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentRequestsDataModelToJson(this);
}

@JsonSerializable()
class ShipmentRequestModel {
  final int? id;
  @JsonKey(name: 'shipment_type')
  final String? shipmentType;
  @JsonKey(name: 'flight_type')
  final String? flightType;
  @JsonKey(name: 'shipment_way')
  final String? shipmentWay;
  @JsonKey(name: 'receiving_branch')
  final String? receivingBranch;
  @JsonKey(name: 'receiving_country')
  final String? receivingCountry;
  @JsonKey(name: 'delivery_branch')
  final String? deliveryBranch;
  @NullableStringConverter()
  final String? code;
  @JsonKey(name: 'delivery_country')
  final String? deliveryCountry;
  @JsonKey(name: 'shipment_content')
  final String? shipmentContent;
  final String? category;
  @JsonKey(name: 'boxes_count')
  final int? boxesCount;
  @JsonKey(name: 'total_weight')
  final String? totalWeight;
  @JsonKey(name: 'total_size')
  @NullableStringConverter()
  final String? totalSize;
  @JsonKey(name: 'tracking_number')
  final String? trackingNumber;
  @JsonKey(name: 'supplier_phone')
  final String? supplierPhone;
  @JsonKey(name: 'supplier_phone_code')
  final String? supplierPhoneCode;
  @JsonKey(name: 'inspection_request')
  final bool? inspectionRequest;
  @JsonKey(name: 'inspection_note')
  final String? inspectionNote;
  final StatusModel? status;
  @JsonKey(name: 'price_per_unit')
  final num? pricePerUnit;
  @JsonKey(name: 'estimated_price')
  final num? estimatedPrice;
  @JsonKey(name: 'shipment_images')
  final List<String>? shipmentImages;
  @JsonKey(name: 'document_images')
  final List<String>? documentImages;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const ShipmentRequestModel({
    this.id,
    this.shipmentType,
    this.flightType,
    this.shipmentWay,
    this.receivingBranch,
    this.deliveryBranch,
    this.shipmentContent,
    this.category,
    this.boxesCount,
    this.totalWeight,
    this.totalSize,
    this.trackingNumber,
    this.supplierPhone,
    this.supplierPhoneCode,
    this.inspectionRequest,
    this.inspectionNote,
    this.status,
    this.pricePerUnit,
    this.estimatedPrice,
    this.shipmentImages,
    this.documentImages,
    this.createdAt,
    this.code,
    this.receivingCountry,
    this.deliveryCountry,
  });

  factory ShipmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentRequestModelToJson(this);
}
