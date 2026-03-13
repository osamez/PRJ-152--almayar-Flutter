import 'package:json_annotation/json_annotation.dart';

part 'country_locations_response.g.dart';

@JsonSerializable()
class CountryLocationsResponse {
  final bool? success;
  final int? status;
  final String? message;
  final String? error;
  final List<CountryLocationModel>? data;

  const CountryLocationsResponse({
    this.success,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory CountryLocationsResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryLocationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryLocationsResponseToJson(this);
}

@JsonSerializable()
class CountryLocationModel {
  final int? id;
  final String? name;
  final String? code;
  final String? flag;
  final List<CityModel>? cities;

  const CountryLocationModel({
    this.id,
    this.name,
    this.code,
    this.flag,
    this.cities,
  });

  factory CountryLocationModel.fromJson(Map<String, dynamic> json) =>
      _$CountryLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryLocationModelToJson(this);
}

@JsonSerializable()
class CityModel {
  final int? id;
  final String? name;
  final List<RegionModel>? regions;

  const CityModel({
    this.id,
    this.name,
    this.regions,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}

@JsonSerializable()
class RegionModel {
  final int? id;
  final String? name;
  final StatusModel? status;

  const RegionModel({
    this.id,
    this.name,
    this.status,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegionModelToJson(this);
}

@JsonSerializable()
class StatusModel {
  final int? id;
  final String? name;
  final String? color;

  const StatusModel({
    this.id,
    this.name,
    this.color,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);
}
