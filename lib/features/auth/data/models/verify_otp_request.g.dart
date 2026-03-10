// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpRequest _$VerifyOtpRequestFromJson(Map<String, dynamic> json) =>
    VerifyOtpRequest(
      whatsappNumber: json['whatsapp_number'] as String?,
      whatsappKey: json['whatsapp_key'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$VerifyOtpRequestToJson(VerifyOtpRequest instance) =>
    <String, dynamic>{
      'whatsapp_number': instance.whatsappNumber,
      'whatsapp_key': instance.whatsappKey,
      'otp': instance.otp,
    };
