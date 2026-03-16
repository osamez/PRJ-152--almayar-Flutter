// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_status_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentStatusCountModel _$ShipmentStatusCountModelFromJson(
  Map<String, dynamic> json,
) => ShipmentStatusCountModel(
  status: json['status'] == null
      ? null
      : ShipmentStatusModel.fromJson(json['status'] as Map<String, dynamic>),
  count: (json['count'] as num?)?.toInt(),
);

Map<String, dynamic> _$ShipmentStatusCountModelToJson(
  ShipmentStatusCountModel instance,
) => <String, dynamic>{'status': instance.status, 'count': instance.count};

ShipmentStatusModel _$ShipmentStatusModelFromJson(Map<String, dynamic> json) =>
    ShipmentStatusModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$ShipmentStatusModelToJson(
  ShipmentStatusModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'color': instance.color,
};
