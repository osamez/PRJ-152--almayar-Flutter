import 'package:json_annotation/json_annotation.dart';
import 'ticket_model.dart';

part 'tickets_response_data_model.g.dart';

@JsonSerializable()
class TicketsResponseDataModel {
  final List<TicketModel>? tickets;
  final TicketsMetaModel? meta;

  const TicketsResponseDataModel({
    this.tickets,
    this.meta,
  });

  factory TicketsResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$TicketsResponseDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketsResponseDataModelToJson(this);
}
