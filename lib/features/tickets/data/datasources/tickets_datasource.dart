import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/tickets/data/models/tickets_response_data_model.dart';

abstract class TicketsDataSource {
  Future<BaseResponse<TicketsResponseDataModel>> getAllTickets();
}
