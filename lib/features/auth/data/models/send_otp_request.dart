import 'package:json_annotation/json_annotation.dart';

part 'send_otp_request.g.dart';

@JsonSerializable()
class SendOtpRequest {
  @JsonKey(name: 'whatsapp_number')
  final String? whatsappNumber;
  @JsonKey(name: 'whatsapp_key')
  final String? whatsappKey;

  const SendOtpRequest({this.whatsappNumber, this.whatsappKey});

  factory SendOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$SendOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendOtpRequestToJson(this);
}
