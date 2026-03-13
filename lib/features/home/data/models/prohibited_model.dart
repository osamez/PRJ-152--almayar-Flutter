import 'package:json_annotation/json_annotation.dart';

part 'prohibited_model.g.dart';

@JsonSerializable()
class ProhibitedModel {
  final String? data;

  const ProhibitedModel({this.data});

  factory ProhibitedModel.fromJson(Map<String, dynamic> json) =>
      _$ProhibitedModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProhibitedModelToJson(this);
}
