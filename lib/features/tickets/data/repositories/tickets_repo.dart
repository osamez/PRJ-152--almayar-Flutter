import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/features/tickets/data/models/tickets_response_data_model.dart';

abstract class TicketsRepo {
  Future<Result<BaseResponse<TicketsResponseDataModel>>> getAllTickets();
}
