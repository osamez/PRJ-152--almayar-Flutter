// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequest _$ResetPasswordRequestFromJson(
  Map<String, dynamic> json,
) => ResetPasswordRequest(
  whatsappNumber: json['whatsapp_number'] as String?,
  whatsappKey: json['whatsapp_key'] as String?,
  otp: json['otp'] as String?,
  password: json['password'] as String?,
  passwordConfirmation: json['password_confirmation'] as String?,
);

Map<String, dynamic> _$ResetPasswordRequestToJson(
  ResetPasswordRequest instance,
) => <String, dynamic>{
  'whatsapp_number': instance.whatsappNumber,
  'whatsapp_key': instance.whatsappKey,
  'otp': instance.otp,
  'password': instance.password,
  'password_confirmation': instance.passwordConfirmation,
};
