import 'package:json_annotation/json_annotation.dart';

part 'add_shipment_request_response_model.g.dart';

@JsonSerializable()
class AddShipmentRequestResponseData {
  @JsonKey(name: 'shipment_request_id')
  final int? shipmentRequestId;
  @JsonKey(name: 'price_per_unit')
  final num? pricePerUnit;
  @JsonKey(name: 'estimated_price')
  final num? estimatedPrice;

  const AddShipmentRequestResponseData({
    this.shipmentRequestId,
    this.pricePerUnit,
    this.estimatedPrice,
  });

  factory AddShipmentRequestResponseData.fromJson(Map<String, dynamic> json) =>
      _$AddShipmentRequestResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddShipmentRequestResponseDataToJson(this);
}
