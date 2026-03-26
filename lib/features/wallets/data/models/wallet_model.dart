import 'package:json_annotation/json_annotation.dart';
import 'currency_model.dart';

part 'wallet_model.g.dart';

@JsonSerializable()
class WalletModel {
  final int? id;
  @JsonKey(name: 'wallet_name')
  final String? walletName;
  final int? amount;
  @JsonKey(name: 'currency_name')
  final String? currencyName;
  @JsonKey(name: 'currency_code')
  final String? currencyCode;
  final CurrencyModel? currency;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const WalletModel({
    this.id,
    this.walletName,
    this.amount,
    this.currencyName,
    this.currencyCode,
    this.currency,
    this.createdAt,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletModelToJson(this);
}
