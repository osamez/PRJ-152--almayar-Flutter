import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/api_constants.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_request_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'pickup_request_api_service.g.dart';

@RestApi()
abstract class PickupRequestApiService {
  factory PickupRequestApiService(Dio dio, {String baseUrl}) =
      _PickupRequestApiService;

  @GET(ApiConstants.shipmentRequests)
  Future<BaseResponse<ShipmentRequestsDataModel>> getShipmentRequests({
    @Query('tracking_number') String? trackingNumber,
    @Query('status') String? status,
    @Query('shipment_type') String? shipmentType,
    @Query('flight_type') String? flightType,
    @Query('shipping_method') String? shippingMethod,
    @Query('shipment_way') String? shipmentWay,
    @Query('page') int? page,
  });
}
