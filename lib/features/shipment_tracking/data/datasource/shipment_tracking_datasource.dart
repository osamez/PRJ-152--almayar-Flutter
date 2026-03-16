import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/shipment_tracking/data/models/shipment_status_count_model.dart';
import 'package:almeyar/features/shipment_tracking/data/models/shipment_tracking_model.dart';

abstract class ShipmentTrackingDataSource {
  Future<BaseResponse<ShipmentTrackingDataModel>> getAllShipments({
    String? type,
    String? status,
    String? code,
    String? flightType,
    int? page,
  });

  Future<BaseResponse<List<ShipmentStatusCountModel>>> getShipmentStatusCounts({
    String? shipmentType,
  });
}
