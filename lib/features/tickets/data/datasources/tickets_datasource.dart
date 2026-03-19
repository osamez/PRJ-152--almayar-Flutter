import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/tickets/data/models/create_ticket_request.dart';
import 'package:almeyar/features/tickets/data/models/ticket_model.dart';
import 'package:almeyar/features/tickets/data/models/tickets_response_data_model.dart';
import 'dart:io';

abstract class TicketsDataSource {
  Future<BaseResponse<TicketsResponseDataModel>> getAllTickets();
  Future<BaseResponse<TicketModel>> createTicket({
    required CreateTicketRequest request,
    List<File>? files,
  });
}
