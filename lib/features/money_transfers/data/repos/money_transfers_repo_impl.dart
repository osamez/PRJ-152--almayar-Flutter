import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';

import '../datasource/money_transfers_datasource.dart';
import '../models/money_transfer_model.dart';
import 'money_transfers_repo.dart';

class MoneyTransfersRepoImpl implements MoneyTransfersRepo {
  final MoneyTransfersDataSource _dataSource;

  const MoneyTransfersRepoImpl(this._dataSource);

  @override
  Future<Result<BaseResponse<MoneyTransferResponse>>> getMoneyTransfers({
    int? status,
    int? page,
  }) async {
    try {
      final response = await _dataSource.getMoneyTransfers(
        status: status,
        page: page,
      );
      AppLogger.info('MoneyTransfersRepoImpl - getMoneyTransfers: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error(
        'MoneyTransfersRepoImpl - getMoneyTransfers: Error',
        e,
        stackTrace,
      );
      return Result.failure(e, stackTrace);
    }
  }
}
