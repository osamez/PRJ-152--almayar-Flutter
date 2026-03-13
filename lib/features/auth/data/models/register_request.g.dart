// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      name: json['name'] as String?,
      email: json['email'] as String?,
      branchId: json['branch_id'] as String?,
      countryId: json['country_id'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
      phone: json['phone'] as String?,
      whatsappPhone: json['whatsapp_phone'] as String?,
      notes: json['notes'] as String?,
      phoneKey: json['phone_key'] as String?,
      whatsappKey: json['whatsapp_key'] as String?,
      cityId: (json['city_id'] as num?)?.toInt(),
      regionId: (json['region_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'branch_id': instance.branchId,
      'country_id': instance.countryId,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'phone': instance.phone,
      'whatsapp_phone': instance.whatsappPhone,
      'notes': instance.notes,
      'phone_key': instance.phoneKey,
      'whatsapp_key': instance.whatsappKey,
      'city_id': instance.cityId,
      'region_id': instance.regionId,
    };
