// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOtpRequest _$SendOtpRequestFromJson(Map<String, dynamic> json) =>
    SendOtpRequest(
      whatsappNumber: json['whatsapp_number'] as String?,
      whatsappKey: json['whatsapp_key'] as String?,
    );

Map<String, dynamic> _$SendOtpRequestToJson(SendOtpRequest instance) =>
    <String, dynamic>{
      'whatsapp_number': instance.whatsappNumber,
      'whatsapp_key': instance.whatsappKey,
    };
