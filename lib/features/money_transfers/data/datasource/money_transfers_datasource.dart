import 'package:almeyar/core/models/base_response.dart';

import '../models/money_transfer_model.dart';

abstract class MoneyTransfersDataSource {
  Future<BaseResponse<MoneyTransferResponse>> getMoneyTransfers({
    int? status,
    int? page,
  });
}
