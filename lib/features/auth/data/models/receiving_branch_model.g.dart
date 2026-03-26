// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiving_branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceivingBranchModel _$ReceivingBranchModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ReceivingBranchModel',
  json,
  ($checkedConvert) {
    final val = ReceivingBranchModel(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      name: $checkedConvert('name', (v) => v as String?),
      countryName: $checkedConvert('country_name', (v) => v as String?),
      branchName: $checkedConvert('branch_name', (v) => v as String?),
      cityName: $checkedConvert('city_name', (v) => v as String?),
      code: $checkedConvert('code', (v) => v as String?),
      notes: $checkedConvert('notes', (v) => v as String?),
      countryId: $checkedConvert('country_id', (v) => (v as num?)?.toInt()),
      cityId: $checkedConvert('city_id', (v) => (v as num?)?.toInt()),
      type: $checkedConvert('type', (v) => v as String?),
      status: $checkedConvert(
        'status',
        (v) => v == null
            ? null
            : BranchStatusModel.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'countryName': 'country_name',
    'branchName': 'branch_name',
    'cityName': 'city_name',
    'countryId': 'country_id',
    'cityId': 'city_id',
  },
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
};

BranchStatusModel _$BranchStatusModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BranchStatusModel', json, ($checkedConvert) {
      final val = BranchStatusModel(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        name: $checkedConvert('name', (v) => v as String?),
        color: $checkedConvert('color', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BranchStatusModelToJson(BranchStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
    };

ShippingWayModel _$ShippingWayModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ShippingWayModel', json, ($checkedConvert) {
      final val = ShippingWayModel(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        name: $checkedConvert('name', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ShippingWayModelToJson(ShippingWayModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
