import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/result.dart';

import '../models/money_transfer_model.dart';

abstract class MoneyTransfersRepo {
  Future<Result<BaseResponse<MoneyTransferResponse>>> getMoneyTransfers({
    int? status,
    int? page,
  });
}
