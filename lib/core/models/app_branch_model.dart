import 'package:almeyar/core/models/status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_branch_model.g.dart';

@JsonSerializable()
class AppBranchModel {
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
  @JsonKey(name: 'available_shipping_ways')
  final List<AppShippingWayModel>? availableShippingWays;

  const AppBranchModel({
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
    this.availableShippingWays,
  });

  factory AppBranchModel.fromJson(Map<String, dynamic> json) =>
      _$AppBranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppBranchModelToJson(this);
}

@JsonSerializable()
class AppShippingWayModel {
  final String? id;
  final String? name;

  const AppShippingWayModel({
    this.id,
    this.name,
  });

  factory AppShippingWayModel.fromJson(Map<String, dynamic> json) =>
      _$AppShippingWayModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppShippingWayModelToJson(this);
}
