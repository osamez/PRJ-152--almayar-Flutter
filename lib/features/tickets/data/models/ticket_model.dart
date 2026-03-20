import 'package:almeyar/core/helpers/helper_func.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'ticket_priority_model.dart';

part 'ticket_model.g.dart';

@JsonSerializable(checked: true)
class TicketModel {
  final int? id;
  @JsonKey(name: 'ticket_number')
  final int? ticketNumber;
  final String? title;
  final String? description;
  final TicketStatusModel? status;
  final TicketPriorityModel? priority;
  @JsonKey(name: 'to_system_id')
  @NullableStringConverter()
  final String? toSystemId;
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
  final List<TicketReplyModel>? replies;

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
    this.replies,
  });

  TicketModel copyWith({
    int? id,
    int? ticketNumber,
    String? title,
    String? description,
    TicketStatusModel? status,
    TicketPriorityModel? priority,
    String? toSystemId,
    String? toSystemName,
    int? shipmentId,
    String? shipmentCode,
    String? file,
    String? createdAt,
    String? updatedAt,
    List<TicketReplyModel>? replies,
  }) {
    return TicketModel(
      id: id ?? this.id,
      ticketNumber: ticketNumber ?? this.ticketNumber,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      toSystemId: toSystemId ?? this.toSystemId,
      toSystemName: toSystemName ?? this.toSystemName,
      shipmentId: shipmentId ?? this.shipmentId,
      shipmentCode: shipmentCode ?? this.shipmentCode,
      file: file ?? this.file,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      replies: replies ?? this.replies,
    );
  }

  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketModelToJson(this);
}

@JsonSerializable()
class TicketReplyModel {
  final int? id;
  @JsonKey(name: 'ticket_id')
  final int? ticketId;
  final String? from;
  @JsonKey(name: 'send_name')
  final String? sendName;
  final String? description;
  final String? file;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const TicketReplyModel({
    this.id,
    this.ticketId,
    this.from,
    this.sendName,
    this.description,
    this.file,
    this.createdAt,
  });

  factory TicketReplyModel.fromJson(Map<String, dynamic> json) =>
      _$TicketReplyModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketReplyModelToJson(this);
}

@JsonSerializable()
class TicketStatusModel {
  final int? id;
  final String? name;
  final String? color;

  const TicketStatusModel({this.id, this.name, this.color});

  factory TicketStatusModel.fromJson(Map<String, dynamic> json) =>
      _$TicketStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketStatusModelToJson(this);
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

extension TicketStatusColorExtension on TicketStatusModel {
  Color get colorValue {
    final apiColor = _resolveApiColor(color);
    if (apiColor != null) return apiColor;

    switch (id) {
      case 3:
        return AppColors.green;
      case 4:
        return AppColors.yellow;
      case 5:
        return AppColors.gray;
      default:
        return AppColors.orange;
    }
  }

  Color? _resolveApiColor(String? raw) {
    final token = raw?.trim().toLowerCase();
    switch (token) {
      case 'primary':
        return AppColors.orange;
      case 'success':
        return AppColors.green;
      case 'danger':
      case 'error':
        return AppColors.error500;
      default:
        return null;
    }
  }
}

extension TicketPriorityColorExtension on TicketPriorityModel {
  Color get colorValue {
    final apiColor = _resolveApiColor(color);
    if (apiColor != null) return apiColor;
    return AppColors.orange;
  }

  Color? _resolveApiColor(String? raw) {
    final token = raw?.trim().toLowerCase();
    switch (token) {
      case 'primary':
        return AppColors.orange;
      case 'success':
        return AppColors.green;
      case 'danger':
      case 'error':
        return AppColors.error500;
      default:
        return null;
    }
  }
}
