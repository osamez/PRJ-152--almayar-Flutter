// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_calculate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteCalculateModel _$NoteCalculateModelFromJson(Map<String, dynamic> json) =>
    NoteCalculateModel(
      message: json['message'] as String?,
      totalInvoice: json['total_invoice'] as num?,
      valueDuePayment: json['value_due_payment'] as num?,
      totalInvoiceCurrencyId: (json['total_invoice_currency_id'] as num?)
          ?.toInt(),
    );

Map<String, dynamic> _$NoteCalculateModelToJson(NoteCalculateModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'total_invoice': instance.totalInvoice,
      'value_due_payment': instance.valueDuePayment,
      'total_invoice_currency_id': instance.totalInvoiceCurrencyId,
    };
