import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/delivery_requests/data/models/delivery_order_details_model.dart';
import 'package:almeyar/features/delivery_requests/data/models/delivery_orders_response_model.dart';

abstract class DeliveryRequestsDataSource {
  Future<BaseResponse<DeliveryOrdersResponseModel>> getDeliveryRequestsOrders({
    String? code,
    String? type,
    int? page,
  });

  Future<BaseResponse<DeliveryOrderDetailsModel>> getDeliveryRequestDetails({
    required int orderId,
  });
}
