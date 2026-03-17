import 'package:almeyar/core/network/api_constants.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/add_purchase_request_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/purchase_orders_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'purchase_orders_api_service.g.dart';

@RestApi()
abstract class PurchaseOrdersApiService {
  factory PurchaseOrdersApiService(Dio dio, {String baseUrl}) = _PurchaseOrdersApiService;

  @GET(ApiConstants.purchaseRequests)
  Future<PurchaseOrdersResponseModel> getPurchaseRequests(
    @Query("page") int? page,
    @Query("status") int? status,
    @Query("code") String? code,
  );

  @POST(ApiConstants.addPurchaseRequest)
  Future<MessageModel> addPurchaseRequest(
    @Body() AddPurchaseRequestModel request,
  );
}
