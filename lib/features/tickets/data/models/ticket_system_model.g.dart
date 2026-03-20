// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_system_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketSystemModel _$TicketSystemModelFromJson(Map<String, dynamic> json) =>
    TicketSystemModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TicketSystemModelToJson(TicketSystemModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
