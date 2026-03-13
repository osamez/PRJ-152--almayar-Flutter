import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: 'whatsapp_number')
  final String? whatsappNumber;
  @JsonKey(name: 'whatsapp_key')
  final String? whatsappKey;
  final String? password;

  const LoginRequest({this.whatsappNumber, this.whatsappKey, this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
