import 'package:json_annotation/json_annotation.dart';

part 'shopping_site_model.g.dart';

@JsonSerializable()
class ShoppingSiteModel {
  final int? id;
  final String? name;
  final String? image;
  final String? url;
  @JsonKey(name: 'sort_order')
  final int? sortOrder;

  const ShoppingSiteModel({
    this.id,
    this.name,
    this.image,
    this.url,
    this.sortOrder,
  });

  factory ShoppingSiteModel.fromJson(Map<String, dynamic> json) =>
      _$ShoppingSiteModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingSiteModelToJson(this);
}
