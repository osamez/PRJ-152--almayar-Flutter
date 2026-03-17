import 'package:json_annotation/json_annotation.dart';

part 'shopping_site_model.g.dart';

@JsonSerializable()
class ShoppingSiteModel {
  final int? id;
  final String? name;
  final String? image;

  const ShoppingSiteModel({
    this.id,
    this.name,
    this.image,
  });

  factory ShoppingSiteModel.fromJson(Map<String, dynamic> json) =>
      _$ShoppingSiteModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingSiteModelToJson(this);
}
