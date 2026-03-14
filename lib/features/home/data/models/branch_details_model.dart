import 'package:almeyar/features/home/data/models/branch_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'branch_details_model.g.dart';

@JsonSerializable()
class BranchDetailsModel {
  final int? id;
  final String? name;
  @JsonKey(name: 'country_name')
  final String? countryName;
  @JsonKey(name: 'city_name')
  final String? cityName;
  final String? state;
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  final String? phone;
  @JsonKey(name: 'address_1')
  final String? address1;
  @JsonKey(name: 'address_2')
  final String? address2;
  final String? notes;
  @JsonKey(name: 'notes_en')
  final String? notesEn;
  final String? code;
  final String? type;
  final String? status;
  @JsonKey(name: 'user_code')
  final String? userCode;
  @JsonKey(name: 'available_shipping_ways')
  final List<ShippingWay>? availableShippingWays;

  const BranchDetailsModel({
    this.id,
    this.name,
    this.countryName,
    this.cityName,
    this.state,
    this.postalCode,
    this.phone,
    this.address1,
    this.address2,
    this.notes,
    this.notesEn,
    this.code,
    this.type,
    this.status,
    this.userCode,
    this.availableShippingWays,
  });

  factory BranchDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BranchDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchDetailsModelToJson(this);
}
