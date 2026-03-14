// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchDetailsModel _$BranchDetailsModelFromJson(Map<String, dynamic> json) =>
    BranchDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      countryName: json['country_name'] as String?,
      cityName: json['city_name'] as String?,
      state: json['state'] as String?,
      postalCode: json['postal_code'] as String?,
      phone: json['phone'] as String?,
      address1: json['address_1'] as String?,
      address2: json['address_2'] as String?,
      notes: json['notes'] as String?,
      notesEn: json['notes_en'] as String?,
      code: json['code'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      userCode: json['user_code'] as String?,
      availableShippingWays: (json['available_shipping_ways'] as List<dynamic>?)
          ?.map((e) => ShippingWay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BranchDetailsModelToJson(BranchDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_name': instance.countryName,
      'city_name': instance.cityName,
      'state': instance.state,
      'postal_code': instance.postalCode,
      'phone': instance.phone,
      'address_1': instance.address1,
      'address_2': instance.address2,
      'notes': instance.notes,
      'notes_en': instance.notesEn,
      'code': instance.code,
      'type': instance.type,
      'status': instance.status,
      'user_code': instance.userCode,
      'available_shipping_ways': instance.availableShippingWays,
    };
