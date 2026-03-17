// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_sites_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingSitesResponseModel _$ShoppingSitesResponseModelFromJson(
  Map<String, dynamic> json,
) => ShoppingSitesResponseModel(
  sites: (json['sites'] as List<dynamic>?)
      ?.map((e) => ShoppingSiteModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShoppingSitesResponseModelToJson(
  ShoppingSitesResponseModel instance,
) => <String, dynamic>{'sites': instance.sites, 'meta': instance.meta};
