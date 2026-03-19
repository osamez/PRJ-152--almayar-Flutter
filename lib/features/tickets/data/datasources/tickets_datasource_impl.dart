import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/tickets/data/api_service/tickets_api_service.dart';
import 'package:almeyar/features/tickets/data/models/tickets_response_data_model.dart';
import 'tickets_datasource.dart';

class TicketsDataSourceImpl implements TicketsDataSource {
  final TicketsApiService _apiService;

  const TicketsDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<TicketsResponseDataModel>> getAllTickets() async {
    return await _apiService.getAllTickets();
  }
}
