import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/api_constants.dart';
import 'package:almeyar/features/shipment_tracking/data/models/shipment_status_count_model.dart';
import 'package:almeyar/features/shipment_tracking/data/models/shipment_tracking_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'shipment_tracking_api_service.g.dart';

@RestApi()
abstract class ShipmentTrackingApiService {
  factory ShipmentTrackingApiService(Dio dio, {String baseUrl}) =
      _ShipmentTrackingApiService;

  @GET(ApiConstants.allShipments)
  Future<BaseResponse<ShipmentTrackingDataModel>> getAllShipments({
    @Query('type') String? type,
    @Query('status') String? status,
    @Query('code') String? code,
    @Query('flight_type') String? flightType,
    @Query('page') int? page,
  });
  @GET(ApiConstants.shipmentStatusCounts)
  Future<BaseResponse<List<ShipmentStatusCountModel>>> getShipmentStatusCounts({
    @Query('shipment_type') String? shipmentType,
  });
}
