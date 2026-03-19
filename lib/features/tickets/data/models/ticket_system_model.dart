import 'package:json_annotation/json_annotation.dart';

part 'ticket_system_model.g.dart';

@JsonSerializable()
class TicketSystemModel {
  final int? id;
  final String? name;

  const TicketSystemModel({
    this.id,
    this.name,
  });

  factory TicketSystemModel.fromJson(Map<String, dynamic> json) =>
      _$TicketSystemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketSystemModelToJson(this);
}
