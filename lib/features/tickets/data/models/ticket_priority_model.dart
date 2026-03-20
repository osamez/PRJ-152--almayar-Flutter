import 'package:json_annotation/json_annotation.dart';

part 'ticket_priority_model.g.dart';

@JsonSerializable()
class TicketPriorityModel {
  final int? id;
  final String? name;
  final String? color;

  const TicketPriorityModel({
    this.id,
    this.name,
    this.color,
  });

  factory TicketPriorityModel.fromJson(Map<String, dynamic> json) =>
      _$TicketPriorityModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketPriorityModelToJson(this);
}
