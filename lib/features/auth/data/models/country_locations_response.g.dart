// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_locations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryLocationsResponse _$CountryLocationsResponseFromJson(
  Map<String, dynamic> json,
) => CountryLocationsResponse(
  success: json['success'] as bool?,
  status: (json['status'] as num?)?.toInt(),
  message: json['message'] as String?,
  error: json['error'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => CountryLocationModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CountryLocationsResponseToJson(
  CountryLocationsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'status': instance.status,
  'message': instance.message,
  'error': instance.error,
  'data': instance.data,
};

CountryLocationModel _$CountryLocationModelFromJson(
  Map<String, dynamic> json,
) => CountryLocationModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  code: json['code'] as String?,
  flag: json['flag'] as String?,
  cities: (json['cities'] as List<dynamic>?)
      ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CountryLocationModelToJson(
  CountryLocationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
  'flag': instance.flag,
  'cities': instance.cities,
};

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  regions: (json['regions'] as List<dynamic>?)
      ?.map((e) => RegionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'regions': instance.regions,
};

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) => RegionModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  status: json['status'] == null
      ? null
      : StatusModel.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegionModelToJson(RegionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
    };

StatusModel _$StatusModelFromJson(Map<String, dynamic> json) => StatusModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  color: json['color'] as String?,
);

Map<String, dynamic> _$StatusModelToJson(StatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
    };
