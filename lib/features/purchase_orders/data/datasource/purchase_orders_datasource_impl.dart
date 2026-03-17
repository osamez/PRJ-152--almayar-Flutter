import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/core/models/wallet_model.dart';
import 'package:almeyar/features/purchase_orders/data/api_service/purchase_orders_api_service.dart';
import 'package:almeyar/features/purchase_orders/data/models/add_purchase_request_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/purchase_orders_response_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/shopping_sites_response_model.dart';
import 'purchase_orders_datasource.dart';

class PurchaseOrdersDataSourceImpl implements PurchaseOrdersDataSource {
  final PurchaseOrdersApiService _apiService;

  PurchaseOrdersDataSourceImpl(this._apiService);

  @override
  Future<PurchaseOrdersResponseModel> getPurchaseRequests(
    int? page,
    int? status,
    String? code,
  ) {
    return _apiService.getPurchaseRequests(page, status, code);
  }

  @override
  Future<MessageModel> addPurchaseRequest(AddPurchaseRequestModel request) {
    return _apiService.addPurchaseRequest(request);
  }

  @override
  Future<BaseResponse<List<WalletModel>>> getMyWallets() {
    return _apiService.getMyWallets();
  }

  @override
  Future<BaseResponse<ShoppingSitesResponseModel>> getShoppingSites(
    String? name,
    int? page,
  ) {
    return _apiService.getShoppingSites(name, page);
  }
}
