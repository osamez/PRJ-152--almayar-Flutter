import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/features/shipment_tracking/data/models/shipment_tracking_model.dart';

abstract class ShipmentTrackingRepository {
  Future<Result<ShipmentTrackingDataModel>> getAllShipments({
    String? type,
    String? status,
    String? code,
    String? flightType,
    int? page,
  });
}
