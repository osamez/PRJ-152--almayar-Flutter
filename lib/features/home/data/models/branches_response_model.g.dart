// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchesResponseModel _$BranchesResponseModelFromJson(
  Map<String, dynamic> json,
) => BranchesResponseModel(
  branches: (json['branches'] as List<dynamic>?)
      ?.map((e) => BranchModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BranchesResponseModelToJson(
  BranchesResponseModel instance,
) => <String, dynamic>{'branches': instance.branches, 'meta': instance.meta};
