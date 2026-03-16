import 'package:json_annotation/json_annotation.dart';

part 'box_dimensions_model.g.dart';

@JsonSerializable()
class BoxDimensionsModel {
  final num? length;
  final num? width;
  final num? height;

  const BoxDimensionsModel({
    this.length,
    this.width,
    this.height,
  });

  factory BoxDimensionsModel.fromJson(Map<String, dynamic> json) =>
      _$BoxDimensionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoxDimensionsModelToJson(this);
}
