import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/features/tickets/data/datasources/tickets_datasource.dart';
import 'package:almeyar/features/tickets/data/models/tickets_response_data_model.dart';
import 'tickets_repo.dart';

class TicketsRepoImpl implements TicketsRepo {
  final TicketsDataSource _dataSource;

  const TicketsRepoImpl(this._dataSource);

  @override
  Future<Result<BaseResponse<TicketsResponseDataModel>>> getAllTickets() async {
    try {
      final response = await _dataSource.getAllTickets();
      AppLogger.info('TicketsRepoImpl - getAllTickets: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('TicketsRepoImpl - getAllTickets: Error', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }
}
