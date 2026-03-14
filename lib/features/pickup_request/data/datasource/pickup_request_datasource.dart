import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/pickup_request/data/api_service/pickup_request_api_service.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_request_model.dart';

abstract class PickupRequestDataSource {
  Future<BaseResponse<ShipmentRequestsDataModel>> getShipmentRequests({
    String? trackingNumber,
    String? status,
    String? shipmentType,
    String? flightType,
    String? shippingMethod,
    String? shipmentWay,
    int? page,
  });
}

class PickupRequestDataSourceImpl implements PickupRequestDataSource {
  final PickupRequestApiService _apiService;

  PickupRequestDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<ShipmentRequestsDataModel>> getShipmentRequests({
    String? trackingNumber,
    String? status,
    String? shipmentType,
    String? flightType,
    String? shippingMethod,
    String? shipmentWay,
    int? page,
  }) {
    return _apiService.getShipmentRequests(
      trackingNumber: trackingNumber,
      status: status,
      shipmentType: shipmentType,
      flightType: flightType,
      shippingMethod: shippingMethod,
      shipmentWay: shipmentWay,
      page: page,
    );
  }
}
