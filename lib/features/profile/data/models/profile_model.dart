import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  final int? id;
  final String? name;
  final String? code;
  @JsonKey(name: 'company_name')
  final String? companyName;
  @JsonKey(name: 'we_chat')
  final String? weChat;
  final ProfilePhoneModel? phone;
  final ProfilePhoneModel? whatsapp;
  @JsonKey(name: 'whatsapp_2')
  final ProfilePhoneModel? whatsapp2;
  @JsonKey(name: 'whatsapp_3')
  final ProfilePhoneModel? whatsapp3;
  @JsonKey(name: 'whatsapp_4')
  final ProfilePhoneModel? whatsapp4;
  final String? notes;
  final String? image;
  @JsonKey(name: 'national_identity_photo')
  final String? nationalIdentityPhoto;
  @JsonKey(name: 'delegate_assignment_letter')
  final String? delegateAssignmentLetter;
  final ProfileBranchModel? branch;
  final ProfileCountryModel? country;
  final ProfileCityModel? city;
  final ProfileCityModel? region;
  final String? verified;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const ProfileModel({
    this.id,
    this.name,
    this.code,
    this.companyName,
    this.weChat,
    this.phone,
    this.whatsapp,
    this.whatsapp2,
    this.whatsapp3,
    this.whatsapp4,
    this.notes,
    this.image,
    this.nationalIdentityPhoto,
    this.delegateAssignmentLetter,
    this.branch,
    this.country,
    this.city,
    this.region,
    this.verified,
    this.createdAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable()
class ProfilePhoneModel {
  final String? key;
  final int? number;

  const ProfilePhoneModel({this.key, this.number});

  factory ProfilePhoneModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilePhoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePhoneModelToJson(this);
}

@JsonSerializable()
class ProfileBranchModel {
  final int? id;
  final String? name;
  @JsonKey(name: 'country_name')
  final String? countryName;
  @JsonKey(name: 'country_flag')
  final String? countryFlag;
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
  final ProfileStatusModel? status;
  @JsonKey(name: 'available_shipping_ways')
  final List<ProfileShippingWayModel>? availableShippingWays;

  const ProfileBranchModel({
    this.id,
    this.name,
    this.countryName,
    this.countryFlag,
    this.branchName,
    this.cityName,
    this.code,
    this.notes,
    this.countryId,
    this.cityId,
    this.type,
    this.status,
    this.availableShippingWays,
  });

  factory ProfileBranchModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileBranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileBranchModelToJson(this);
}

@JsonSerializable()
class ProfileShippingWayModel {
  final String? id;
  final String? name;

  const ProfileShippingWayModel({this.id, this.name});

  factory ProfileShippingWayModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileShippingWayModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileShippingWayModelToJson(this);
}

@JsonSerializable()
class ProfileCountryModel {
  final int? id;
  final String? name;
  final String? code;
  final String? flag;
  final ProfileCurrencyModel? currency;
  final ProfileStatusModel? status;

  const ProfileCountryModel({
    this.id,
    this.name,
    this.code,
    this.flag,
    this.currency,
    this.status,
  });

  factory ProfileCountryModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileCountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileCountryModelToJson(this);
}

@JsonSerializable()
class ProfileCurrencyModel {
  final int? id;
  final String? name;
  final String? code;

  const ProfileCurrencyModel({this.id, this.name, this.code});

  factory ProfileCurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileCurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileCurrencyModelToJson(this);
}

@JsonSerializable()
class ProfileCityModel {
  final int? id;
  final String? name;
  final ProfileStatusModel? status;

  const ProfileCityModel({this.id, this.name, this.status});

  factory ProfileCityModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileCityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileCityModelToJson(this);
}

@JsonSerializable()
class ProfileStatusModel {
  final int? id;
  final String? name;
  final String? color;

  const ProfileStatusModel({this.id, this.name, this.color});

  factory ProfileStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileStatusModelToJson(this);
}
