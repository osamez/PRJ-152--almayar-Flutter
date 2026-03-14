import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/features/pickup_request/data/datasource/pickup_request_datasource.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_request_model.dart';

abstract class PickupRequestRepository {
  Future<Result<ShipmentRequestsDataModel>> getShipmentRequests({
    String? trackingNumber,
    String? status,
    String? shipmentType,
    String? flightType,
    String? shippingMethod,
    String? shipmentWay,
    int? page,
  });
}

class PickupRequestRepositoryImpl implements PickupRequestRepository {
  final PickupRequestDataSource _dataSource;

  PickupRequestRepositoryImpl(this._dataSource);

  @override
  Future<Result<ShipmentRequestsDataModel>> getShipmentRequests({
    String? trackingNumber,
    String? status,
    String? shipmentType,
    String? flightType,
    String? shippingMethod,
    String? shipmentWay,
    int? page,
  }) async {
    try {
      final response = await _dataSource.getShipmentRequests(
        trackingNumber: trackingNumber,
        status: status,
        shipmentType: shipmentType,
        flightType: flightType,
        shippingMethod: shippingMethod,
        shipmentWay: shipmentWay,
        page: page,
      );
      if (response.data != null) {
        AppLogger.info(
          'PickupRequestRepositoryImpl - getShipmentRequests: Success',
        );
        return Result.success(response.data!);
      } else {
        AppLogger.error(
          'PickupRequestRepositoryImpl - getShipmentRequests: Data is null',
        );
        return Result.failure(Exception('Data is null'), StackTrace.current);
      }
    } catch (e, st) {
      AppLogger.error(
        'PickupRequestRepositoryImpl - getShipmentRequests: Error',
        e,
        st,
      );
      return Result.failure(e, st);
    }
  }
}
