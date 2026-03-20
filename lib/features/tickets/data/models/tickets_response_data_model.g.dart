// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_response_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketsResponseDataModel _$TicketsResponseDataModelFromJson(
  Map<String, dynamic> json,
) => TicketsResponseDataModel(
  tickets: (json['tickets'] as List<dynamic>?)
      ?.map((e) => TicketModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : TicketsMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TicketsResponseDataModelToJson(
  TicketsResponseDataModel instance,
) => <String, dynamic>{'tickets': instance.tickets, 'meta': instance.meta};
