import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/delivery_requests/data/api_service/delivery_requests_api_service.dart';
import 'package:almeyar/features/delivery_requests/data/models/delivery_order_details_model.dart';
import 'package:almeyar/features/delivery_requests/data/models/delivery_orders_response_model.dart';
import 'package:almeyar/features/delivery_requests/data/datasource/delivery_requests_datasource.dart';

class DeliveryRequestsDataSourceImpl implements DeliveryRequestsDataSource {
  final DeliveryRequestsApiService _apiService;

  const DeliveryRequestsDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<DeliveryOrdersResponseModel>> getDeliveryRequestsOrders({
    String? code,
    String? type,
    int? page,
  }) async {
    return await _apiService.getDeliveryRequestsOrders(
      code: code,
      type: type,
      page: page,
    );
  }

  @override
  Future<BaseResponse<DeliveryOrderDetailsModel>> getDeliveryRequestDetails({
    required int orderId,
  }) async {
    return await _apiService.getDeliveryRequestDetails(orderId: orderId);
  }
}
