import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/api_constants.dart';
import 'package:almeyar/features/tickets/data/models/ticket_model.dart';
import 'package:almeyar/features/tickets/data/models/tickets_response_data_model.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'tickets_api_service.g.dart';

@RestApi()
abstract class TicketsApiService {
  factory TicketsApiService(Dio dio, {String baseUrl}) = _TicketsApiService;

  @GET(ApiConstants.allTickets)
  Future<BaseResponse<TicketsResponseDataModel>> getAllTickets();

  @POST(ApiConstants.createTicket)
  @MultiPart()
  Future<BaseResponse<TicketModel>> createTicket({
    @Part(name: 'title') String? title,
    @Part(name: 'description') String? description,
    @Part(name: 'from_system') String? fromSystem,
    @Part(name: 'to_system') String? toSystem,
    @Part(name: 'priority') String? priority,
    @Part(name: 'shipment_code') String? shipmentCode,
    @Part(name: 'file[]') List<MultipartFile>? files,
  });

  @GET(ApiConstants.showTicket)
  Future<BaseResponse<TicketModel>> getTicketDetails(
    @Query('ticket_id') int ticketId,
  );

  @POST(ApiConstants.replyTicket)
  @MultiPart()
  Future<BaseResponse<TicketReplyModel>> replyTicket({
    @Part(name: 'description') String? description,
    @Part(name: 'ticket_id') String? ticketId,
    @Part(name: 'file[]') List<MultipartFile>? files,
  });
}
