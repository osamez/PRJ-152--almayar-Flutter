// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      success: json['success'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
  token: json['token'] as String?,
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
  'token': instance.token,
  'user': instance.user,
};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  code: json['code'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] == null
      ? null
      : PhoneModel.fromJson(json['phone'] as Map<String, dynamic>),
  whatsappPhone: json['whatsapp_phone'] == null
      ? null
      : PhoneModel.fromJson(json['whatsapp_phone'] as Map<String, dynamic>),
  notes: json['notes'] as String?,
  image: json['image'] as String?,
  nationalIdentityPhoto: json['national_identity_photo'] as String?,
  branch: json['branch'] == null
      ? null
      : BranchModel.fromJson(json['branch'] as Map<String, dynamic>),
  country: json['country'] == null
      ? null
      : CountryModel.fromJson(json['country'] as Map<String, dynamic>),
  verified: json['verified'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
  'email': instance.email,
  'phone': instance.phone,
  'whatsapp_phone': instance.whatsappPhone,
  'notes': instance.notes,
  'image': instance.image,
  'national_identity_photo': instance.nationalIdentityPhoto,
  'branch': instance.branch,
  'country': instance.country,
  'verified': instance.verified,
  'created_at': instance.createdAt,
};

PhoneModel _$PhoneModelFromJson(Map<String, dynamic> json) =>
    PhoneModel(key: json['key'] as String?, number: json['number'] as num?);

Map<String, dynamic> _$PhoneModelToJson(PhoneModel instance) =>
    <String, dynamic>{'key': instance.key, 'number': instance.number};

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => BranchModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  countryName: json['country_name'] as String?,
  branchName: json['branch_name'] as String?,
  cityName: json['city_name'] as String?,
  code: json['code'] as String?,
  notes: json['notes'] as String?,
  countryId: (json['country_id'] as num?)?.toInt(),
  cityId: (json['city_id'] as num?)?.toInt(),
  type: json['type'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$BranchModelToJson(BranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_name': instance.countryName,
      'branch_name': instance.branchName,
      'city_name': instance.cityName,
      'code': instance.code,
      'notes': instance.notes,
      'country_id': instance.countryId,
      'city_id': instance.cityId,
      'type': instance.type,
      'status': instance.status,
    };

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  code: json['code'] as String?,
  flag: json['flag'] as String?,
  currency: json['currency'] == null
      ? null
      : CurrencyModel.fromJson(json['currency'] as Map<String, dynamic>),
  status: json['status'] as String?,
);

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'flag': instance.flag,
      'currency': instance.currency,
      'status': instance.status,
    };

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
