import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/api_constants.dart';
import 'package:almeyar/features/delivery_requests/data/models/delivery_orders_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'delivery_requests_api_service.g.dart';

@RestApi()
abstract class DeliveryRequestsApiService {
  factory DeliveryRequestsApiService(Dio dio, {String baseUrl}) =
      _DeliveryRequestsApiService;

  @GET(ApiConstants.deliveryRequestsOrders)
  Future<BaseResponse<DeliveryOrdersResponseModel>> getDeliveryRequestsOrders({
    @Query('code') String? code,
    @Query('type') String? type,
    @Query('page') int? page,
  });
}
