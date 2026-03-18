// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_transfer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoneyTransferResponse _$MoneyTransferResponseFromJson(
  Map<String, dynamic> json,
) => MoneyTransferResponse(
  moneyTransfers: (json['money_transfers'] as List<dynamic>?)
      ?.map((e) => MoneyTransferModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MoneyTransferResponseToJson(
  MoneyTransferResponse instance,
) => <String, dynamic>{
  'money_transfers': instance.moneyTransfers,
  'meta': instance.meta,
};

MoneyTransferModel _$MoneyTransferModelFromJson(Map<String, dynamic> json) =>
    MoneyTransferModel(
      id: (json['id'] as num?)?.toInt(),
      supplierName: json['supplier_name'] as String?,
      supplierAddress: json['supplier_address'] as String?,
      supplierPhone: json['supplier_phone'] as String?,
      supplierPhoneCode: json['supplier_phone_code'] as String?,
      invoiceValue: json['invoice_value'] == null
          ? null
          : AmountCurrencyModel.fromJson(
              json['invoice_value'] as Map<String, dynamic>,
            ),
      totalInvoice: json['total_invoice'] == null
          ? null
          : AmountCurrencyModel.fromJson(
              json['total_invoice'] as Map<String, dynamic>,
            ),
      valueDuePayment: json['value_due_payment'] == null
          ? null
          : AmountCurrencyModel.fromJson(
              json['value_due_payment'] as Map<String, dynamic>,
            ),
      notes: json['notes'] as String?,
      message: json['message'] as String?,
      status: json['status'] == null
          ? null
          : StatusModel.fromJson(json['status'] as Map<String, dynamic>),
      verifySupplier: json['verify_supplier'] as bool?,
      currencyPurchaseStatus: json['currency_purchase_status'] as bool?,
      createdAt: json['created_at'] as String?,
      invoiceImage: json['invoice_image'] as String?,
      paymentProofImage: json['payment_proof_image'] as String?,
      invoiceCurrency: json['invoice_currency'] as String?,
      paymentCurrency: json['payment_currency'] as String?,
      yuanAmount: json['yuan_amount'] as String?,
      dollarAmount: json['dollar_amount'] as String?,
    );

Map<String, dynamic> _$MoneyTransferModelToJson(MoneyTransferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'supplier_name': instance.supplierName,
      'supplier_address': instance.supplierAddress,
      'supplier_phone': instance.supplierPhone,
      'supplier_phone_code': instance.supplierPhoneCode,
      'invoice_value': instance.invoiceValue,
      'total_invoice': instance.totalInvoice,
      'value_due_payment': instance.valueDuePayment,
      'notes': instance.notes,
      'message': instance.message,
      'status': instance.status,
      'verify_supplier': instance.verifySupplier,
      'currency_purchase_status': instance.currencyPurchaseStatus,
      'created_at': instance.createdAt,
      'invoice_image': instance.invoiceImage,
      'payment_proof_image': instance.paymentProofImage,
      'invoice_currency': instance.invoiceCurrency,
      'payment_currency': instance.paymentCurrency,
      'yuan_amount': instance.yuanAmount,
      'dollar_amount': instance.dollarAmount,
    };

AmountCurrencyModel _$AmountCurrencyModelFromJson(Map<String, dynamic> json) =>
    AmountCurrencyModel(
      amount: json['amount'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$AmountCurrencyModelToJson(
  AmountCurrencyModel instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'currency': instance.currency,
};
