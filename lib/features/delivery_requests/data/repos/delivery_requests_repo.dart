import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/features/delivery_requests/data/models/delivery_orders_response_model.dart';

abstract class DeliveryRequestsRepo {
  Future<Result<DeliveryOrdersResponseModel>> getDeliveryRequestsOrders({
    String? code,
    String? type,
    int? page,
  });
}
