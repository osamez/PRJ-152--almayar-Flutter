// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiving_branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceivingBranchModel _$ReceivingBranchModelFromJson(
  Map<String, dynamic> json,
) => ReceivingBranchModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  countryName: json['country_name'] as String?,
  branchName: json['branch_name'] as String?,
  cityName: json['city_name'] as String?,
  code: json['code'] as String?,
  notes: json['notes'] as String?,
  countryId: (json['country_id'] as num?)?.toInt(),
  cityId: (json['city_id'] as num?)?.toInt(),
  type: json['type'] as String?,
  status: json['status'] == null
      ? null
      : BranchStatusModel.fromJson(json['status'] as Map<String, dynamic>),
  availableShippingWays: (json['available_shipping_ways'] as List<dynamic>?)
      ?.map((e) => ShippingWayModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReceivingBranchModelToJson(
  ReceivingBranchModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'country_name': instance.countryName,
  'branch_name': instance.branchName,
  'city_name': instance.cityName,
  'code': instance.code,
  'notes': instance.notes,
  'country_id': instance.countryId,
  'city_id': instance.cityId,
  'type': instance.type,
  'status': instance.status,
  'available_shipping_ways': instance.availableShippingWays,
};

BranchStatusModel _$BranchStatusModelFromJson(Map<String, dynamic> json) =>
    BranchStatusModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$BranchStatusModelToJson(BranchStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
    };

ShippingWayModel _$ShippingWayModelFromJson(Map<String, dynamic> json) =>
    ShippingWayModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ShippingWayModelToJson(ShippingWayModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
