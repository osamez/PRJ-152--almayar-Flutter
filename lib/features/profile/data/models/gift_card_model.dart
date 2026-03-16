import 'package:json_annotation/json_annotation.dart';

part 'gift_card_model.g.dart';

@JsonSerializable()
class GiftCardModel {
  final int? id;
  final String? code;
  final double? value;
  @JsonKey(name: 'value_used')
  final double? valueUsed;
  @JsonKey(name: 'remaining_value')
  final double? remainingValue;
  @JsonKey(name: 'expiry_date')
  final String? expiryDate;
  @JsonKey(name: 'is_used')
  final String? isUsed;
  final String? notes;

  const GiftCardModel({
    this.id,
    this.code,
    this.value,
    this.valueUsed,
    this.remainingValue,
    this.expiryDate,
    this.isUsed,
    this.notes,
  });

  factory GiftCardModel.fromJson(Map<String, dynamic> json) =>
      _$GiftCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$GiftCardModelToJson(this);
}
