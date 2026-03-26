import 'package:json_annotation/json_annotation.dart';

part 'deposit_metadata_model.g.dart';

@JsonSerializable()
class DepositMetadataModel {
  @JsonKey(name: 'transfer_types')
  final List<TransferTypeModel>? transferTypes;
  final List<CurrencyModel>? currencies;

  const DepositMetadataModel({
    this.transferTypes,
    this.currencies,
  });

  factory DepositMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$DepositMetadataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepositMetadataModelToJson(this);
}

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

@JsonSerializable()
class CurrencyModel {
  final int? id;
  final String? name;
  final String? code;

  const CurrencyModel({
    this.id,
    this.name,
    this.code,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}
