// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositModel _$DepositModelFromJson(Map<String, dynamic> json) => DepositModel(
  id: (json['id'] as num?)?.toInt(),
  amount: json['amount'] as String?,
  currency: json['currency'] == null
      ? null
      : CurrencyModel.fromJson(json['currency'] as Map<String, dynamic>),
  transferType: json['transfer_type'] == null
      ? null
      : TransferTypeModel.fromJson(
          json['transfer_type'] as Map<String, dynamic>,
        ),
  attachment: json['attachment'] as String?,
  depositCode: json['deposit_code'] as String?,
  status: json['status'] == null
      ? null
      : StatusModel.fromJson(json['status'] as Map<String, dynamic>),
  processedByName: json['processed_by_name'] as String?,
  adminNote: json['admin_note'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$DepositModelToJson(DepositModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'currency': instance.currency,
      'transfer_type': instance.transferType,
      'attachment': instance.attachment,
      'deposit_code': instance.depositCode,
      'status': instance.status,
      'processed_by_name': instance.processedByName,
      'admin_note': instance.adminNote,
      'created_at': instance.createdAt,
    };
