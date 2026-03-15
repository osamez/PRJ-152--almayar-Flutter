// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentCategoryModel _$ShipmentCategoryModelFromJson(
  Map<String, dynamic> json,
) => ShipmentCategoryModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  type: json['type'] as String?,
  status: json['status'] == null
      ? null
      : CategoryStatusModel.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShipmentCategoryModelToJson(
  ShipmentCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'status': instance.status,
};

CategoryStatusModel _$CategoryStatusModelFromJson(Map<String, dynamic> json) =>
    CategoryStatusModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$CategoryStatusModelToJson(
  CategoryStatusModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'color': instance.color,
};
