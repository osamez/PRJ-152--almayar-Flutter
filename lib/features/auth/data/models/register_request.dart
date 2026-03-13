import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String? name;
  final String? email;
  @JsonKey(name: 'branch_id')
  final String? branchId;
  @JsonKey(name: 'country_id')
  final String? countryId;
  final String? password;
  @JsonKey(name: 'password_confirmation')
  final String? passwordConfirmation;
  final String? phone;
  @JsonKey(name: 'whatsapp_phone')
  final String? whatsappPhone;
  final String? notes;
  @JsonKey(name: 'phone_key')
  final String? phoneKey;
  @JsonKey(name: 'whatsapp_key')
  final String? whatsappKey;
  @JsonKey(name: 'city_id')
  final int? cityId;
  @JsonKey(name: 'region_id')
  final int? regionId;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final File? nationalIdentityPhoto;

  const RegisterRequest({
    this.name,
    this.email,
    this.branchId,
    this.countryId,
    this.password,
    this.passwordConfirmation,
    this.phone,
    this.whatsappPhone,
    this.notes,
    this.phoneKey,
    this.whatsappKey,
    this.cityId,
    this.regionId,
    this.nationalIdentityPhoto,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
