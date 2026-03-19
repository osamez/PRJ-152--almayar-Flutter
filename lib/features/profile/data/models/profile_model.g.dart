// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  code: json['code'] as String?,
  companyName: json['company_name'] as String?,
  weChat: json['we_chat'] as String?,
  phone: ProfileModel._profilePhoneFromJson(json['phone']),
  whatsapp: ProfileModel._profilePhoneFromJson(json['whatsapp']),
  whatsapp2: ProfileModel._profilePhoneFromJson(json['whatsapp_2']),
  whatsapp3: ProfileModel._profilePhoneFromJson(json['whatsapp_3']),
  whatsapp4: ProfileModel._profilePhoneFromJson(json['whatsapp_4']),
  notes: json['notes'] as String?,
  image: json['image'] as String?,
  nationalIdentityPhoto: json['national_identity_photo'] as String?,
  delegateAssignmentLetter: json['delegate_assignment_letter'] as String?,
  branch: json['branch'] == null
      ? null
      : ProfileBranchModel.fromJson(json['branch'] as Map<String, dynamic>),
  country: json['country'] == null
      ? null
      : ProfileCountryModel.fromJson(json['country'] as Map<String, dynamic>),
  city: json['city'] == null
      ? null
      : ProfileCityModel.fromJson(json['city'] as Map<String, dynamic>),
  region: json['region'] == null
      ? null
      : ProfileCityModel.fromJson(json['region'] as Map<String, dynamic>),
  verified: json['verified'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'company_name': instance.companyName,
      'we_chat': instance.weChat,
      'phone': ProfileModel._profilePhoneToJson(instance.phone),
      'whatsapp': ProfileModel._profilePhoneToJson(instance.whatsapp),
      'whatsapp_2': ProfileModel._profilePhoneToJson(instance.whatsapp2),
      'whatsapp_3': ProfileModel._profilePhoneToJson(instance.whatsapp3),
      'whatsapp_4': ProfileModel._profilePhoneToJson(instance.whatsapp4),
      'notes': instance.notes,
      'image': instance.image,
      'national_identity_photo': instance.nationalIdentityPhoto,
      'delegate_assignment_letter': instance.delegateAssignmentLetter,
      'branch': instance.branch,
      'country': instance.country,
      'city': instance.city,
      'region': instance.region,
      'verified': instance.verified,
      'created_at': instance.createdAt,
    };

ProfilePhoneModel _$ProfilePhoneModelFromJson(Map<String, dynamic> json) =>
    ProfilePhoneModel(
      key: json['key'] as String?,
      number: ProfilePhoneModel._numberFromJson(json['number']),
    );

Map<String, dynamic> _$ProfilePhoneModelToJson(ProfilePhoneModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'number': ProfilePhoneModel._numberToJson(instance.number),
    };

ProfileBranchModel _$ProfileBranchModelFromJson(Map<String, dynamic> json) =>
    ProfileBranchModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      countryName: json['country_name'] as String?,
      countryFlag: json['country_flag'] as String?,
      branchName: json['branch_name'] as String?,
      cityName: json['city_name'] as String?,
      code: json['code'] as String?,
      notes: json['notes'] as String?,
      countryId: (json['country_id'] as num?)?.toInt(),
      cityId: (json['city_id'] as num?)?.toInt(),
      type: json['type'] as String?,
      status: json['status'] == null
          ? null
          : ProfileStatusModel.fromJson(json['status'] as Map<String, dynamic>),
      availableShippingWays: (json['available_shipping_ways'] as List<dynamic>?)
          ?.map(
            (e) => ProfileShippingWayModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$ProfileBranchModelToJson(ProfileBranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_name': instance.countryName,
      'country_flag': instance.countryFlag,
      'branch_name': instance.branchName,
      'city_name': instance.cityName,
      'code': instance.code,
      'notes': instance.notes,
      'country_id': instance.countryId,
      'city_id': instance.cityId,
      'type': instance.type,
      'status': instance.status,
      'available_shipping_ways': instance.availableShippingWays,
    };

ProfileShippingWayModel _$ProfileShippingWayModelFromJson(
  Map<String, dynamic> json,
) => ProfileShippingWayModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
);

Map<String, dynamic> _$ProfileShippingWayModelToJson(
  ProfileShippingWayModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

ProfileCountryModel _$ProfileCountryModelFromJson(Map<String, dynamic> json) =>
    ProfileCountryModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      flag: json['flag'] as String?,
      currency: json['currency'] == null
          ? null
          : ProfileCurrencyModel.fromJson(
              json['currency'] as Map<String, dynamic>,
            ),
      status: json['status'] == null
          ? null
          : ProfileStatusModel.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileCountryModelToJson(
  ProfileCountryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
  'flag': instance.flag,
  'currency': instance.currency,
  'status': instance.status,
};

ProfileCurrencyModel _$ProfileCurrencyModelFromJson(
  Map<String, dynamic> json,
) => ProfileCurrencyModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  code: json['code'] as String?,
);

Map<String, dynamic> _$ProfileCurrencyModelToJson(
  ProfileCurrencyModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
};

ProfileCityModel _$ProfileCityModelFromJson(Map<String, dynamic> json) =>
    ProfileCityModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      status: json['status'] == null
          ? null
          : ProfileStatusModel.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileCityModelToJson(ProfileCityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
    };

ProfileStatusModel _$ProfileStatusModelFromJson(Map<String, dynamic> json) =>
    ProfileStatusModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$ProfileStatusModelToJson(ProfileStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
    };
