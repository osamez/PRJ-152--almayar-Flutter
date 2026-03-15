import 'package:json_annotation/json_annotation.dart';

part 'shipment_content_model.g.dart';

@JsonSerializable()
class ShipmentContentModel {
  final int? id;
  final String? name;

  const ShipmentContentModel({
    this.id,
    this.name,
  });

  factory ShipmentContentModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentContentModelToJson(this);
}
