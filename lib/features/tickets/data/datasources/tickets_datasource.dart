import 'dart:io';
import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/tickets/data/models/create_ticket_request.dart';
import 'package:almeyar/features/tickets/data/models/ticket_model.dart';
import 'package:almeyar/features/tickets/data/models/ticket_replies_response_data_model.dart';
import 'package:almeyar/features/tickets/data/models/ticket_system_model.dart';
import 'package:almeyar/features/tickets/data/models/tickets_response_data_model.dart';

abstract class TicketsDataSource {
  Future<BaseResponse<TicketsResponseDataModel>> getAllTickets({
    int? status,
    int? page,
  });
  Future<BaseResponse<TicketModel>> createTicket({
    required CreateTicketRequest request,
    List<File>? files,
  });
  Future<BaseResponse<TicketModel>> getTicketDetails(int ticketId);
  Future<BaseResponse<TicketRepliesResponseDataModel>> getTicketReplies(
      int ticketId);
  Future<BaseResponse<TicketReplyModel>> replyTicket({
    required String ticketId,
    String? description,
    List<File>? files,
  });
  Future<BaseResponse<List<TicketSystemModel>>> getTicketSystems();
}
