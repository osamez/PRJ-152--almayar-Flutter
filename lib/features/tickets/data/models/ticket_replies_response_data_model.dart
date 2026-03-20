import 'package:json_annotation/json_annotation.dart';
import 'ticket_model.dart';

part 'ticket_replies_response_data_model.g.dart';

@JsonSerializable()
class TicketRepliesResponseDataModel {
  final List<TicketReplyModel>? replies;
  final TicketsMetaModel? meta;

  const TicketRepliesResponseDataModel({
    this.replies,
    this.meta,
  });

  factory TicketRepliesResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$TicketRepliesResponseDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketRepliesResponseDataModelToJson(this);
}
