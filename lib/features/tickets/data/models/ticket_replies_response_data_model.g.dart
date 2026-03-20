// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_replies_response_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketRepliesResponseDataModel _$TicketRepliesResponseDataModelFromJson(
  Map<String, dynamic> json,
) => TicketRepliesResponseDataModel(
  replies: (json['replies'] as List<dynamic>?)
      ?.map((e) => TicketReplyModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : TicketsMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TicketRepliesResponseDataModelToJson(
  TicketRepliesResponseDataModel instance,
) => <String, dynamic>{'replies': instance.replies, 'meta': instance.meta};
