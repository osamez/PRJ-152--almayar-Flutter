// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposits_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositsResponseModel _$DepositsResponseModelFromJson(
  Map<String, dynamic> json,
) => DepositsResponseModel(
  deposits: (json['deposits'] as List<dynamic>?)
      ?.map((e) => DepositModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DepositsResponseModelToJson(
  DepositsResponseModel instance,
) => <String, dynamic>{'deposits': instance.deposits, 'meta': instance.meta};
