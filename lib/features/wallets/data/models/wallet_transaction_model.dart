import 'package:json_annotation/json_annotation.dart';

part 'wallet_transaction_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WalletTransactionModel {
  final int? id;
  final int? typeId;
  final String? typeName;
  final String? typeColor;
  final double? amount;
  final double? balanceBefore;
  final double? balanceAfter;
  final String? notes;
  final String? createdAt;

  const WalletTransactionModel({
    this.id,
    this.typeId,
    this.typeName,
    this.typeColor,
    this.amount,
    this.balanceBefore,
    this.balanceAfter,
    this.notes,
    this.createdAt,
  });

  factory WalletTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletTransactionModelToJson(this);
}
