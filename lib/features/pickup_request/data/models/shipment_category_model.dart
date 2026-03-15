import 'package:json_annotation/json_annotation.dart';

part 'shipment_category_model.g.dart';

@JsonSerializable()
class ShipmentCategoryModel {
  final int? id;
  final String? name;
  final String? type;
  final CategoryStatusModel? status;

  const ShipmentCategoryModel({
    this.id,
    this.name,
    this.type,
    this.status,
  });

  factory ShipmentCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentCategoryModelToJson(this);
}

@JsonSerializable()
class CategoryStatusModel {
  final int? id;
  final String? name;
  final String? color;

  const CategoryStatusModel({
    this.id,
    this.name,
    this.color,
  });

  factory CategoryStatusModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryStatusModelToJson(this);
}
