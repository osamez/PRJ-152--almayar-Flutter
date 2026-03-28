import 'package:json_annotation/json_annotation.dart';

part 'note_calculate_model.g.dart';

@JsonSerializable()
class NoteCalculateModel {
  final String? message;
  @JsonKey(name: 'total_invoice')
  final num? totalInvoice;
  @JsonKey(name: 'value_due_payment')
  final num? valueDuePayment;
  @JsonKey(name: 'total_invoice_currency_id')
  final int? totalInvoiceCurrencyId;

  const NoteCalculateModel({
    this.message,
    this.totalInvoice,
    this.valueDuePayment,
    this.totalInvoiceCurrencyId,
  });

  factory NoteCalculateModel.fromJson(Map<String, dynamic> json) =>
      _$NoteCalculateModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteCalculateModelToJson(this);
}
