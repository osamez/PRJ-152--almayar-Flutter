import 'package:json_annotation/json_annotation.dart';

part 'branch_model.g.dart';

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
  final BranchStatus? status;
  @JsonKey(name: 'available_shipping_ways')
  final List<ShippingWay>? availableShippingWays;

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
    this.availableShippingWays,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchModelToJson(this);
}

@JsonSerializable()
class BranchStatus {
  final int? id;
  final String? name;
  final String? color;

  const BranchStatus({
    this.id,
    this.name,
    this.color,
  });

  factory BranchStatus.fromJson(Map<String, dynamic> json) =>
      _$BranchStatusFromJson(json);

  Map<String, dynamic> toJson() => _$BranchStatusToJson(this);
}

@JsonSerializable()
class ShippingWay {
  final int? id;
  final String? name;

  const ShippingWay({
    this.id,
    this.name,
  });

  factory ShippingWay.fromJson(Map<String, dynamic> json) =>
      _$ShippingWayFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingWayToJson(this);
}
