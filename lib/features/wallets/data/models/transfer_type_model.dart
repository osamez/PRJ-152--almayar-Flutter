import 'package:json_annotation/json_annotation.dart';

part 'transfer_type_model.g.dart';

@JsonSerializable()
class TransferTypeModel {
  final int? id;
  final String? name;

  const TransferTypeModel({
    this.id,
    this.name,
  });

  factory TransferTypeModel.fromJson(Map<String, dynamic> json) =>
      _$TransferTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransferTypeModelToJson(this);
}
