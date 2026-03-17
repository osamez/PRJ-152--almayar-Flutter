import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/core/models/wallet_model.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/features/purchase_orders/data/datasource/purchase_orders_datasource.dart';
import 'package:almeyar/features/purchase_orders/data/models/add_purchase_request_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/purchase_orders_response_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/shopping_sites_response_model.dart';
import 'purchase_orders_repo.dart';

class PurchaseOrdersRepoImpl implements PurchaseOrdersRepo {
  final PurchaseOrdersDataSource _dataSource;

  PurchaseOrdersRepoImpl(this._dataSource);

  @override
  Future<Result<PurchaseOrdersResponseModel>> getPurchaseRequests(
    int? page,
    int? status,
    String? code,
  ) async {
    try {
      final response = await _dataSource.getPurchaseRequests(
        page,
        status,
        code,
      );
      AppLogger.info('PurchaseOrdersRepoImpl - getPurchaseRequests: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error(
        'PurchaseOrdersRepoImpl - getPurchaseRequests: Error',
        e,
        st,
      );
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<MessageModel>> addPurchaseRequest(
    AddPurchaseRequestModel request,
  ) async {
    try {
      final response = await _dataSource.addPurchaseRequest(request);
      AppLogger.info('PurchaseOrdersRepoImpl - addPurchaseRequest: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error(
        'PurchaseOrdersRepoImpl - addPurchaseRequest: Error',
        e,
        st,
      );
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<BaseResponse<List<WalletModel>>>> getMyWallets() async {
    try {
      final response = await _dataSource.getMyWallets();
      AppLogger.info('PurchaseOrdersRepoImpl - getMyWallets: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('PurchaseOrdersRepoImpl - getMyWallets: Error', e, st);
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<BaseResponse<ShoppingSitesResponseModel>>> getShoppingSites(
    String? name,
    int? page,
  ) async {
    try {
      final response = await _dataSource.getShoppingSites(name, page);
      AppLogger.info('PurchaseOrdersRepoImpl - getShoppingSites: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error(
        'PurchaseOrdersRepoImpl - getShoppingSites: Error',
        e,
        st,
      );
      return Result.failure(e, st);
    }
  }
}
