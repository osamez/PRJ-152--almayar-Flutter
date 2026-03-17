import 'package:json_annotation/json_annotation.dart';

part 'wallet_model.g.dart';

@JsonSerializable()
class Wallet {
  final int? id;
  @JsonKey(name: 'wallet_name')
  final String? walletName;
  final num? amount;
  @JsonKey(name: 'currency_name')
  final String? currencyName;
  @JsonKey(name: 'currency_code')
  final String? currencyCode;
  final Currency? currency;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const Wallet({
    this.id,
    this.walletName,
    this.amount,
    this.currencyName,
    this.currencyCode,
    this.currency,
    this.createdAt,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  Map<String, dynamic> toJson() => _$WalletToJson(this);
}

@JsonSerializable()
class Currency {
  final int? id;
  final String? name;
  final String? code;

  const Currency({
    this.id,
    this.name,
    this.code,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
