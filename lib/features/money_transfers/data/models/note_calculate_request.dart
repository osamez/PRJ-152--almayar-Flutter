import 'package:json_annotation/json_annotation.dart';

part 'note_calculate_request.g.dart';

@JsonSerializable()
class NoteCalculateRequest {
  @JsonKey(name: 'invoice_value')
  final String? invoiceValue;
  @JsonKey(name: 'payment_currency_id')
  final String? paymentCurrencyId;
  @JsonKey(name: 'currency_id')
  final String? currencyId;

  const NoteCalculateRequest({
    this.invoiceValue,
    this.paymentCurrencyId,
    this.currencyId,
  });

  factory NoteCalculateRequest.fromJson(Map<String, dynamic> json) =>
      _$NoteCalculateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NoteCalculateRequestToJson(this);
}
