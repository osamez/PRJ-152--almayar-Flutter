import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/shipment_tracking/data/api_service/shipment_tracking_api_service.dart';
import 'package:almeyar/features/shipment_tracking/data/datasource/shipment_tracking_datasource.dart';
import 'package:almeyar/features/shipment_tracking/data/models/shipment_tracking_model.dart';

class ShipmentTrackingDataSourceImpl implements ShipmentTrackingDataSource {
  final ShipmentTrackingApiService _apiService;

  ShipmentTrackingDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<ShipmentTrackingDataModel>> getAllShipments({
    String? type,
    String? status,
    String? code,
    String? flightType,
    int? page,
  }) {
    return _apiService.getAllShipments(
      type: type,
      status: status,
      code: code,
      flightType: flightType,
      page: page,
    );
  }
}
