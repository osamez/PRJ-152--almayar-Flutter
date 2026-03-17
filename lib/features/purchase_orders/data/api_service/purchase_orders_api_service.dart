import 'package:almeyar/core/network/api_constants.dart';
import 'package:almeyar/features/purchase_orders/data/models/purchase_orders_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'purchase_orders_api_service.g.dart';

@RestApi()
abstract class PurchaseOrdersApiService {
  factory PurchaseOrdersApiService(Dio dio, {String baseUrl}) = _PurchaseOrdersApiService;

  @GET(ApiConstants.purchaseRequests)
  Future<PurchaseOrdersResponseModel> getPurchaseRequests(@Query("page") int? page);
}
