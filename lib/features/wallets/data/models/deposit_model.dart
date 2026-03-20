import 'package:json_annotation/json_annotation.dart';
import '../../../../core/models/status_model.dart';
import 'currency_model.dart';
import 'transfer_type_model.dart';

part 'deposit_model.g.dart';

@JsonSerializable()
class DepositModel {
  final int? id;
  final String? amount;
  final CurrencyModel? currency;
  @JsonKey(name: 'transfer_type')
  final TransferTypeModel? transferType;
  final String? attachment;
  @JsonKey(name: 'deposit_code')
  final String? depositCode;
  final StatusModel? status;
  @JsonKey(name: 'processed_by_name')
  final String? processedByName;
  @JsonKey(name: 'admin_note')
  final String? adminNote;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const DepositModel({
    this.id,
    this.amount,
    this.currency,
    this.transferType,
    this.attachment,
    this.depositCode,
    this.status,
    this.processedByName,
    this.adminNote,
    this.createdAt,
  });

  factory DepositModel.fromJson(Map<String, dynamic> json) =>
      _$DepositModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepositModelToJson(this);
}
