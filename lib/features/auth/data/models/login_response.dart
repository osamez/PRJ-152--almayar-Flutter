import 'package:almeyar/core/helpers/helper_func.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool? success;
  final int? status;
  final String? message;
  final String? error;
  final LoginData? data;

  const LoginResponse({
    this.success,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  final String? token;
  final UserModel? user;

  const LoginData({this.token, this.user});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class UserModel {
  final int? id;
  final String? name;
  final String? code;
  final String? email;
  final PhoneModel? phone;
  @JsonKey(name: 'whatsapp_phone')
  final PhoneModel? whatsappPhone;
  final String? notes;
  final String? image;
  @JsonKey(name: 'national_identity_photo')
  final String? nationalIdentityPhoto;
  final BranchModel? branch;
  final CountryModel? country;
  final String? verified;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const UserModel({
    this.id,
    this.name,
    this.code,
    this.email,
    this.phone,
    this.whatsappPhone,
    this.notes,
    this.image,
    this.nationalIdentityPhoto,
    this.branch,
    this.country,
    this.verified,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class PhoneModel {
  final String? key;
  @NullableStringConverter()
  final String? number;

  const PhoneModel({this.key, this.number});

  factory PhoneModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneModelToJson(this);
}

@JsonSerializable()
class BranchModel {
  final int? id;
  final String? name;
  @JsonKey(name: 'country_name')
  final String? countryName;
  @JsonKey(name: 'branch_name')
  final String? branchName;
  @JsonKey(name: 'city_name')
  final String? cityName;
  final String? code;
  final String? notes;
  @JsonKey(name: 'country_id')
  final int? countryId;
  @JsonKey(name: 'city_id')
  final int? cityId;
  final String? type;
  final StatusModel? status;

  const BranchModel({
    this.id,
    this.name,
    this.countryName,
    this.branchName,
    this.cityName,
    this.code,
    this.notes,
    this.countryId,
    this.cityId,
    this.type,
    this.status,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchModelToJson(this);
}

@JsonSerializable()
class CountryModel {
  final int? id;
  final String? name;
  final String? code;
  final String? flag;
  final CurrencyModel? currency;
  final StatusModel? status;

  const CountryModel({
    this.id,
    this.name,
    this.code,
    this.flag,
    this.currency,
    this.status,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}

@JsonSerializable()
class CurrencyModel {
  final int? id;
  final String? name;
  final String? code;

  const CurrencyModel({this.id, this.name, this.code});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}

@JsonSerializable()
class StatusModel {
  final int? id;
  final String? name;
  final String? color;

  const StatusModel({this.id, this.name, this.color});

  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);
}
