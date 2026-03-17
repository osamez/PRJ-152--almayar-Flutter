import 'package:almeyar/core/models/meta_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/shopping_site_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shopping_sites_response_model.g.dart';

@JsonSerializable()
class ShoppingSitesResponseModel {
  final List<ShoppingSiteModel>? sites;
  final MetaModel? meta;

  const ShoppingSitesResponseModel({this.sites, this.meta});

  factory ShoppingSitesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ShoppingSitesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingSitesResponseModelToJson(this);
}
