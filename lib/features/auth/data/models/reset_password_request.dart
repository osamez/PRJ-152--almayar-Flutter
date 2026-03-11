import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable()
class ResetPasswordRequest {
  @JsonKey(name: 'whatsapp_number')
  final String? whatsappNumber;

  @JsonKey(name: 'whatsapp_key')
  final String? whatsappKey;

  final String? otp;

  final String? password;

  @JsonKey(name: 'password_confirmation')
  final String? passwordConfirmation;

  const ResetPasswordRequest({
    this.whatsappNumber,
    this.whatsappKey,
    this.otp,
    this.password,
    this.passwordConfirmation,
  });

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
