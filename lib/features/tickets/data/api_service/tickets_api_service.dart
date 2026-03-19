import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/api_constants.dart';
import 'package:almeyar/features/tickets/data/models/tickets_response_data_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'tickets_api_service.g.dart';

@RestApi()
abstract class TicketsApiService {
  factory TicketsApiService(Dio dio, {String baseUrl}) = _TicketsApiService;

  @GET(ApiConstants.allTickets)
  Future<BaseResponse<TicketsResponseDataModel>> getAllTickets();
}
