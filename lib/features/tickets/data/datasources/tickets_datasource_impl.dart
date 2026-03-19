import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/tickets/data/api_service/tickets_api_service.dart';
import 'package:almeyar/features/tickets/data/datasources/tickets_datasource.dart';
import 'package:almeyar/features/tickets/data/models/create_ticket_request.dart';
import 'package:almeyar/features/tickets/data/models/ticket_model.dart';
import 'package:almeyar/features/tickets/data/models/ticket_replies_response_data_model.dart';
import 'package:almeyar/features/tickets/data/models/ticket_system_model.dart';
import 'package:almeyar/features/tickets/data/models/tickets_response_data_model.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class TicketsDataSourceImpl implements TicketsDataSource {
  final TicketsApiService _apiService;

  const TicketsDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<TicketsResponseDataModel>> getAllTickets() async {
    return await _apiService.getAllTickets();
  }

  @override
  Future<BaseResponse<TicketModel>> createTicket({
    required CreateTicketRequest request,
    List<File>? files,
  }) async {
    List<MultipartFile>? multipartFiles;
    if (files != null) {
      multipartFiles = [];
      for (var file in files) {
        multipartFiles.add(await MultipartFile.fromFile(file.path));
      }
    }

    return await _apiService.createTicket(
      title: request.title,
      description: request.description,
      fromSystem: request.fromSystem,
      toSystem: request.toSystem,
      priority: request.priority,
      shipmentCode: request.shipmentCode,
      files: multipartFiles,
    );
  }

  @override
  Future<BaseResponse<TicketModel>> getTicketDetails(int ticketId) async {
    return await _apiService.getTicketDetails(ticketId);
  }

  @override
  Future<BaseResponse<TicketRepliesResponseDataModel>> getTicketReplies(
      int ticketId) async {
    return await _apiService.getTicketReplies(ticketId);
  }

  @override
  Future<BaseResponse<TicketReplyModel>> replyTicket({
    required String ticketId,
    String? description,
    List<File>? files,
  }) async {
    List<MultipartFile>? multipartFiles;
    if (files != null) {
      multipartFiles = [];
      for (var file in files) {
        multipartFiles.add(await MultipartFile.fromFile(file.path));
      }
    }

    return await _apiService.replyTicket(
      ticketId: ticketId,
      description: description,
      files: multipartFiles,
    );
  }

  @override
  Future<BaseResponse<List<TicketSystemModel>>> getTicketSystems() async {
    return await _apiService.getTicketSystems();
  }
}
