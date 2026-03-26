import 'package:json_annotation/json_annotation.dart';

part 'receiving_branch_model.g.dart';

@JsonSerializable(checked: true)
class ReceivingBranchModel {
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
  final BranchStatusModel? status;

  const ReceivingBranchModel({
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

  factory ReceivingBranchModel.fromJson(Map<String, dynamic> json) =>
      _$ReceivingBranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReceivingBranchModelToJson(this);
}

@JsonSerializable(checked: true)
class BranchStatusModel {
  final int? id;
  final String? name;
  final String? color;

  const BranchStatusModel({this.id, this.name, this.color});

  factory BranchStatusModel.fromJson(Map<String, dynamic> json) =>
      _$BranchStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchStatusModelToJson(this);
}

@JsonSerializable(checked: true)
class ShippingWayModel {
  final int? id;
  final String? name;

  const ShippingWayModel({this.id, this.name});

  factory ShippingWayModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingWayModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingWayModelToJson(this);
}
