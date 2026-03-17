import 'package:almeyar/core/models/wallet_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_wallets_response_model.g.dart';

@JsonSerializable()
class MyWalletsResponseModel {
  final bool? success;
  final int? status;
  final String? message;
  final dynamic error;
  final List<Wallet>? data;

  const MyWalletsResponseModel({
    this.success,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory MyWalletsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MyWalletsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyWalletsResponseModelToJson(this);
}
