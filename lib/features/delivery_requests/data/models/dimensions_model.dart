import 'package:json_annotation/json_annotation.dart';

part 'dimensions_model.g.dart';

@JsonSerializable()
class DimensionsModel {
  final String? height;
  final String? width;
  final String? length;

  const DimensionsModel({
    this.height,
    this.width,
    this.length,
  });

  factory DimensionsModel.fromJson(Map<String, dynamic> json) =>
      _$DimensionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsModelToJson(this);
}
