// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  'TicketModel',
  json,
  ($checkedConvert) {
    final val = TicketModel(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      ticketNumber: $checkedConvert(
        'ticket_number',
        (v) => (v as num?)?.toInt(),
      ),
      title: $checkedConvert('title', (v) => v as String?),
      description: $checkedConvert('description', (v) => v as String?),
      status: $checkedConvert(
        'status',
        (v) => v == null
            ? null
            : TicketStatusModel.fromJson(v as Map<String, dynamic>),
      ),
      priority: $checkedConvert(
        'priority',
        (v) => v == null
            ? null
            : TicketPriorityModel.fromJson(v as Map<String, dynamic>),
      ),
      toSystemId: $checkedConvert(
        'to_system_id',
        (v) => const NullableStringConverter().fromJson(v),
      ),
      toSystemName: $checkedConvert('to_system_name', (v) => v as String?),
      shipmentId: $checkedConvert('shipment_id', (v) => (v as num?)?.toInt()),
      shipmentCode: $checkedConvert('shipment_code', (v) => v as String?),
      file: $checkedConvert('file', (v) => v as String?),
      createdAt: $checkedConvert('created_at', (v) => v as String?),
      updatedAt: $checkedConvert('updated_at', (v) => v as String?),
      replies: $checkedConvert(
        'replies',
        (v) => (v as List<dynamic>?)
            ?.map((e) => TicketReplyModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'ticketNumber': 'ticket_number',
    'toSystemId': 'to_system_id',
    'toSystemName': 'to_system_name',
    'shipmentId': 'shipment_id',
    'shipmentCode': 'shipment_code',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$TicketModelToJson(
  TicketModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'ticket_number': instance.ticketNumber,
  'title': instance.title,
  'description': instance.description,
  'status': instance.status,
  'priority': instance.priority,
  'to_system_id': const NullableStringConverter().toJson(instance.toSystemId),
  'to_system_name': instance.toSystemName,
  'shipment_id': instance.shipmentId,
  'shipment_code': instance.shipmentCode,
  'file': instance.file,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'replies': instance.replies,
};

TicketReplyModel _$TicketReplyModelFromJson(Map<String, dynamic> json) =>
    TicketReplyModel(
      id: (json['id'] as num?)?.toInt(),
      ticketId: (json['ticket_id'] as num?)?.toInt(),
      from: json['from'] as String?,
      sendName: json['send_name'] as String?,
      description: json['description'] as String?,
      file: json['file'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$TicketReplyModelToJson(TicketReplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_id': instance.ticketId,
      'from': instance.from,
      'send_name': instance.sendName,
      'description': instance.description,
      'file': instance.file,
      'created_at': instance.createdAt,
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
