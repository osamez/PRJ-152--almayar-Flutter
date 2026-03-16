import 'package:json_annotation/json_annotation.dart';

part 'shipment_status_count_model.g.dart';

@JsonSerializable()
class ShipmentStatusCountModel {
  final ShipmentStatusModel? status;
  final int? count;

  const ShipmentStatusCountModel({
    this.status,
    this.count,
  });

  factory ShipmentStatusCountModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentStatusCountModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentStatusCountModelToJson(this);
}

@JsonSerializable()
class ShipmentStatusModel {
  final int? id;
  final String? name;
  final String? color;

  const ShipmentStatusModel({
    this.id,
    this.name,
    this.color,
  });

  factory ShipmentStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentStatusModelToJson(this);
}
