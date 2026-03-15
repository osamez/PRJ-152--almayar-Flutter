// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_shipment_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddShipmentRequestResponseData _$AddShipmentRequestResponseDataFromJson(
  Map<String, dynamic> json,
) => AddShipmentRequestResponseData(
  shipmentRequestId: (json['shipment_request_id'] as num?)?.toInt(),
  pricePerUnit: json['price_per_unit'] as num?,
  estimatedPrice: json['estimated_price'] as num?,
);

Map<String, dynamic> _$AddShipmentRequestResponseDataToJson(
  AddShipmentRequestResponseData instance,
) => <String, dynamic>{
  'shipment_request_id': instance.shipmentRequestId,
  'price_per_unit': instance.pricePerUnit,
  'estimated_price': instance.estimatedPrice,
};
