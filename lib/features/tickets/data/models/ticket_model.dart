import 'package:json_annotation/json_annotation.dart';

part 'ticket_model.g.dart';

@JsonSerializable()
class TicketModel {
  final int? id;
  @JsonKey(name: 'ticket_number')
  final int? ticketNumber;
  final String? title;
  final String? description;
  final TicketStatusModel? status;
  final TicketPriorityModel? priority;
  @JsonKey(name: 'to_system_id')
  final int? toSystemId;
  @JsonKey(name: 'to_system_name')
  final String? toSystemName;
  @JsonKey(name: 'shipment_id')
  final int? shipmentId;
  @JsonKey(name: 'shipment_code')
  final String? shipmentCode;
  final String? file;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const TicketModel({
    this.id,
    this.ticketNumber,
    this.title,
    this.description,
    this.status,
    this.priority,
    this.toSystemId,
    this.toSystemName,
    this.shipmentId,
    this.shipmentCode,
    this.file,
    this.createdAt,
    this.updatedAt,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketModelToJson(this);
}

@JsonSerializable()
class TicketStatusModel {
  final int? id;
  final String? name;
  final String? color;

  const TicketStatusModel({
    this.id,
    this.name,
    this.color,
  });

  factory TicketStatusModel.fromJson(Map<String, dynamic> json) =>
      _$TicketStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketStatusModelToJson(this);
}

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

@JsonSerializable()
class TicketsMetaModel {
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @JsonKey(name: 'per_page')
  final int? perPage;
  final int? total;

  const TicketsMetaModel({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
  });

  factory TicketsMetaModel.fromJson(Map<String, dynamic> json) =>
      _$TicketsMetaModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketsMetaModelToJson(this);
}
