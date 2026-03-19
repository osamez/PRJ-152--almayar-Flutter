// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_priority_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketPriorityModel _$TicketPriorityModelFromJson(Map<String, dynamic> json) =>
    TicketPriorityModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TicketPriorityModelToJson(
  TicketPriorityModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
