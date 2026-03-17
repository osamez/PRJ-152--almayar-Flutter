import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/features/delivery_requests/data/datasource/delivery_requests_datasource.dart';
import 'package:almeyar/features/delivery_requests/data/models/delivery_orders_response_model.dart';
import 'package:almeyar/features/delivery_requests/data/repos/delivery_requests_repo.dart';

class DeliveryRequestsRepoImpl implements DeliveryRequestsRepo {
  final DeliveryRequestsDataSource _dataSource;

  const DeliveryRequestsRepoImpl(this._dataSource);

  @override
  Future<Result<DeliveryOrdersResponseModel>> getDeliveryRequestsOrders({
    String? code,
    String? type,
    int? page,
  }) async {
    try {
      final response = await _dataSource.getDeliveryRequestsOrders(
        code: code,
        type: type,
        page: page,
      );
      AppLogger.info('DeliveryRequestsRepoImpl - getDeliveryRequestsOrders: Success');
      return Result.success(response.data!);
    } catch (e, st) {
      AppLogger.error('DeliveryRequestsRepoImpl - getDeliveryRequestsOrders: Error', e, st);
      return Result.failure(e, st);
    }
  }
}
