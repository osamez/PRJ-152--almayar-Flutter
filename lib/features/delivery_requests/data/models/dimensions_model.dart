import 'package:almeyar/core/helpers/helper_func.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dimensions_model.g.dart';

@JsonSerializable(checked: true)
class DimensionsModel {
  @NullableStringConverter()
  final String? height;
  @NullableStringConverter()
  final String? width;
  @NullableStringConverter()
  final String? length;

  const DimensionsModel({this.height, this.width, this.length});

  factory DimensionsModel.fromJson(Map<String, dynamic> json) =>
      _$DimensionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsModelToJson(this);
}
