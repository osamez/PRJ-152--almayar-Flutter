// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_calculate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteCalculateRequest _$NoteCalculateRequestFromJson(
  Map<String, dynamic> json,
) => NoteCalculateRequest(
  invoiceValue: json['invoice_value'] as String?,
  paymentCurrencyId: json['payment_currency_id'] as String?,
  currencyId: json['currency_id'] as String?,
);

Map<String, dynamic> _$NoteCalculateRequestToJson(
  NoteCalculateRequest instance,
) => <String, dynamic>{
  'invoice_value': instance.invoiceValue,
  'payment_currency_id': instance.paymentCurrencyId,
  'currency_id': instance.currencyId,
};
