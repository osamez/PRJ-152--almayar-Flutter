// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletTransactionModel _$WalletTransactionModelFromJson(
  Map<String, dynamic> json,
) => WalletTransactionModel(
  id: (json['id'] as num?)?.toInt(),
  typeId: (json['type_id'] as num?)?.toInt(),
  typeName: json['type_name'] as String?,
  typeColor: json['type_color'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  balanceBefore: (json['balance_before'] as num?)?.toDouble(),
  balanceAfter: (json['balance_after'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$WalletTransactionModelToJson(
  WalletTransactionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'type_id': instance.typeId,
  'type_name': instance.typeName,
  'type_color': instance.typeColor,
  'amount': instance.amount,
  'balance_before': instance.balanceBefore,
  'balance_after': instance.balanceAfter,
  'notes': instance.notes,
  'created_at': instance.createdAt,
};
