// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
  whatsappNumber: json['whatsapp_number'] as String?,
  whatsappKey: json['whatsapp_key'] as String?,
  password: json['password'] as String?,
);

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'whatsapp_number': instance.whatsappNumber,
      'whatsapp_key': instance.whatsappKey,
      'password': instance.password,
    };
