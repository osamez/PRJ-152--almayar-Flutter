// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_metadata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositMetadataModel _$DepositMetadataModelFromJson(
  Map<String, dynamic> json,
) => DepositMetadataModel(
  transferTypes: (json['transfer_types'] as List<dynamic>?)
      ?.map((e) => TransferTypeModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  currencies: (json['currencies'] as List<dynamic>?)
      ?.map((e) => CurrencyModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DepositMetadataModelToJson(
  DepositMetadataModel instance,
) => <String, dynamic>{
  'transfer_types': instance.transferTypes,
  'currencies': instance.currencies,
};

TransferTypeModel _$TransferTypeModelFromJson(Map<String, dynamic> json) =>
    TransferTypeModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TransferTypeModelToJson(TransferTypeModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
