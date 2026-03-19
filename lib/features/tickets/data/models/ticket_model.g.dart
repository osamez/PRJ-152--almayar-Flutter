// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => TicketModel(
  id: (json['id'] as num?)?.toInt(),
  ticketNumber: (json['ticket_number'] as num?)?.toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  status: json['status'] == null
      ? null
      : TicketStatusModel.fromJson(json['status'] as Map<String, dynamic>),
  priority: json['priority'] == null
      ? null
      : TicketPriorityModel.fromJson(json['priority'] as Map<String, dynamic>),
  toSystemId: (json['to_system_id'] as num?)?.toInt(),
  toSystemName: json['to_system_name'] as String?,
  shipmentId: (json['shipment_id'] as num?)?.toInt(),
  shipmentCode: json['shipment_code'] as String?,
  file: json['file'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_number': instance.ticketNumber,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'priority': instance.priority,
      'to_system_id': instance.toSystemId,
      'to_system_name': instance.toSystemName,
      'shipment_id': instance.shipmentId,
      'shipment_code': instance.shipmentCode,
      'file': instance.file,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

TicketStatusModel _$TicketStatusModelFromJson(Map<String, dynamic> json) =>
    TicketStatusModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$TicketStatusModelToJson(TicketStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
    };

TicketPriorityModel _$TicketPriorityModelFromJson(Map<String, dynamic> json) =>
    TicketPriorityModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$TicketPriorityModelToJson(
  TicketPriorityModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'color': instance.color,
};

TicketsMetaModel _$TicketsMetaModelFromJson(Map<String, dynamic> json) =>
    TicketsMetaModel(
      currentPage: (json['current_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TicketsMetaModelToJson(TicketsMetaModel instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };
