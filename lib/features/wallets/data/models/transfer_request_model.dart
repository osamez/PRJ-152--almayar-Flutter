import 'package:json_annotation/json_annotation.dart';

part 'transfer_request_model.g.dart';

@JsonSerializable()
class TransferRequestModel {
  @JsonKey(name: 'from_wallet_id')
  final String fromWalletId;
  @JsonKey(name: 'target_user_code')
  final String targetUserCode;
  final String amount;
  final String otp;

  const TransferRequestModel({
    required this.fromWalletId,
    required this.targetUserCode,
    required this.amount,
    required this.otp,
  });

  factory TransferRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TransferRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransferRequestModelToJson(this);
}
