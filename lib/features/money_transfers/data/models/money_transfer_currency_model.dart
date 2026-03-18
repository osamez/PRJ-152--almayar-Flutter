import 'package:json_annotation/json_annotation.dart';

part 'money_transfer_currency_model.g.dart';

@JsonSerializable()
class MoneyTransferCurrencyModel {
  final int? id;
  final String? name;
  final String? code;

  const MoneyTransferCurrencyModel({this.id, this.name, this.code});

  factory MoneyTransferCurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$MoneyTransferCurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoneyTransferCurrencyModelToJson(this);
}
