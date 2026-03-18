import 'package:almeyar/core/models/base_response.dart';

import '../api_service/money_transfers_api_service.dart';
import '../models/money_transfer_model.dart';
import 'money_transfers_datasource.dart';

class MoneyTransfersDataSourceImpl implements MoneyTransfersDataSource {
  final MoneyTransfersApiService _apiService;

  const MoneyTransfersDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<MoneyTransferResponse>> getMoneyTransfers({
    int? status,
    int? page,
  }) async {
    return await _apiService.getMoneyTransfers(status: status, page: page);
  }
}
