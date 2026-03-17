import 'package:json_annotation/json_annotation.dart';

part 'wallet_currency_model.g.dart';

@JsonSerializable()
class WalletCurrencyModel {
  final int? id;
  final String? name;
  final String? symbol;

  const WalletCurrencyModel({
    this.id,
    this.name,
    this.symbol,
  });

  factory WalletCurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$WalletCurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletCurrencyModelToJson(this);
}
