import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/features/tickets/data/models/create_ticket_request.dart';
import 'package:almeyar/features/tickets/data/models/ticket_model.dart';
import 'package:almeyar/features/tickets/data/models/ticket_replies_response_data_model.dart';
import 'package:almeyar/features/tickets/data/models/tickets_response_data_model.dart';
import 'dart:io';

abstract class TicketsRepo {
  Future<Result<BaseResponse<TicketsResponseDataModel>>> getAllTickets();
  Future<Result<BaseResponse<TicketModel>>> createTicket({
    required CreateTicketRequest request,
    List<File>? files,
  });
  Future<Result<BaseResponse<TicketModel>>> getTicketDetails(int ticketId);
  Future<Result<BaseResponse<TicketRepliesResponseDataModel>>> getTicketReplies(
      int ticketId);
  Future<Result<BaseResponse<TicketReplyModel>>> replyTicket({
    required String ticketId,
    String? description,
    List<File>? files,
  });
}
