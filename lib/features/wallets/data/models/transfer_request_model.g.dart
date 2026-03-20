// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferRequestModel _$TransferRequestModelFromJson(
  Map<String, dynamic> json,
) => TransferRequestModel(
  fromWalletId: json['from_wallet_id'] as String,
  targetUserCode: json['target_user_code'] as String,
  amount: json['amount'] as String,
  otp: json['otp'] as String,
);

Map<String, dynamic> _$TransferRequestModelToJson(
  TransferRequestModel instance,
) => <String, dynamic>{
  'from_wallet_id': instance.fromWalletId,
  'target_user_code': instance.targetUserCode,
  'amount': instance.amount,
  'otp': instance.otp,
};
