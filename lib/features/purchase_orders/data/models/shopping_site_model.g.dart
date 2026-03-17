// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_site_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingSiteModel _$ShoppingSiteModelFromJson(Map<String, dynamic> json) =>
    ShoppingSiteModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ShoppingSiteModelToJson(ShoppingSiteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
