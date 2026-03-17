import 'package:almeyar/features/purchase_orders/data/api_service/purchase_orders_api_service.dart';
import 'package:almeyar/features/purchase_orders/data/models/purchase_orders_response_model.dart';

abstract class PurchaseOrdersDataSource {
  Future<PurchaseOrdersResponseModel> getPurchaseRequests(
    int? page,
    int? status,
    String? code,
  );
}

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
}
