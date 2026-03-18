import 'package:almeyar/core/models/meta_model.dart';
import 'package:almeyar/features/auth/data/models/country_locations_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'money_transfer_model.g.dart';

@JsonSerializable()
class MoneyTransferResponse {
  @JsonKey(name: 'money_transfers')
  final List<MoneyTransferModel>? moneyTransfers;
  final MetaModel? meta;

  const MoneyTransferResponse({this.moneyTransfers, this.meta});

  factory MoneyTransferResponse.fromJson(Map<String, dynamic> json) =>
      _$MoneyTransferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoneyTransferResponseToJson(this);
}

@JsonSerializable()
class MoneyTransferModel {
  final int? id;
  @JsonKey(name: 'supplier_name')
  final String? supplierName;
  @JsonKey(name: 'supplier_address')
  final String? supplierAddress;
  @JsonKey(name: 'supplier_phone')
  final String? supplierPhone;
  @JsonKey(name: 'supplier_phone_code')
  final String? supplierPhoneCode;
  @JsonKey(name: 'invoice_value')
  final AmountCurrencyModel? invoiceValue;
  @JsonKey(name: 'total_invoice')
  final AmountCurrencyModel? totalInvoice;
  @JsonKey(name: 'value_due_payment')
  final AmountCurrencyModel? valueDuePayment;
  final String? notes;
  final String? message;
  final StatusModel? status;
  @JsonKey(name: 'verify_supplier')
  final bool? verifySupplier;
  @JsonKey(name: 'currency_purchase_status')
  final bool? currencyPurchaseStatus;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'invoice_image')
  final String? invoiceImage;
  @JsonKey(name: 'payment_proof_image')
  final String? paymentProofImage;
  @JsonKey(name: 'invoice_currency')
  final String? invoiceCurrency;
  @JsonKey(name: 'payment_currency')
  final String? paymentCurrency;
  @JsonKey(name: 'yuan_amount')
  final String? yuanAmount;
  @JsonKey(name: 'dollar_amount')
  final String? dollarAmount;

  const MoneyTransferModel({
    this.id,
    this.supplierName,
    this.supplierAddress,
    this.supplierPhone,
    this.supplierPhoneCode,
    this.invoiceValue,
    this.totalInvoice,
    this.valueDuePayment,
    this.notes,
    this.message,
    this.status,
    this.verifySupplier,
    this.currencyPurchaseStatus,
    this.createdAt,
    this.invoiceImage,
    this.paymentProofImage,
    this.invoiceCurrency,
    this.paymentCurrency,
    this.yuanAmount,
    this.dollarAmount,
  });

  factory MoneyTransferModel.fromJson(Map<String, dynamic> json) =>
      _$MoneyTransferModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoneyTransferModelToJson(this);
}

@JsonSerializable()
class AmountCurrencyModel {
  final String? amount;
  final String? currency;

  const AmountCurrencyModel({this.amount, this.currency});

  factory AmountCurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$AmountCurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$AmountCurrencyModelToJson(this);
}
