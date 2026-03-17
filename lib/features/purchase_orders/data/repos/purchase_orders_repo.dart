import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/features/purchase_orders/data/datasource/purchase_orders_datasource.dart';
import 'package:almeyar/features/purchase_orders/data/models/purchase_orders_response_model.dart';

abstract class PurchaseOrdersRepo {
  Future<Result<PurchaseOrdersResponseModel>> getPurchaseRequests(int? page);
}

class PurchaseOrdersRepoImpl implements PurchaseOrdersRepo {
  final PurchaseOrdersDataSource _dataSource;

  PurchaseOrdersRepoImpl(this._dataSource);

  @override
  Future<Result<PurchaseOrdersResponseModel>> getPurchaseRequests(int? page) async {
    try {
      final response = await _dataSource.getPurchaseRequests(page);
      AppLogger.info('PurchaseOrdersRepoImpl - getPurchaseRequests: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('PurchaseOrdersRepoImpl - getPurchaseRequests: Error', e, st);
      return Result.failure(e, st);
    }
  }
}
