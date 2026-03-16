import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/features/shipment_tracking/data/datasource/shipment_tracking_datasource.dart';
import 'package:almeyar/features/shipment_tracking/data/models/shipment_tracking_model.dart';
import 'package:almeyar/features/shipment_tracking/data/repositories/shipment_tracking_repo.dart';

class ShipmentTrackingRepositoryImpl implements ShipmentTrackingRepository {
  final ShipmentTrackingDataSource _dataSource;

  ShipmentTrackingRepositoryImpl(this._dataSource);

  @override
  Future<Result<ShipmentTrackingDataModel>> getAllShipments({
    String? type,
    String? status,
    String? code,
    String? flightType,
    int? page,
  }) async {
    try {
      final response = await _dataSource.getAllShipments(
        type: type,
        status: status,
        code: code,
        flightType: flightType,
        page: page,
      );
      if (response.data != null) {
        AppLogger.info('ShipmentTrackingRepositoryImpl - getAllShipments: Success');
        return Result.success(response.data!);
      } else {
        AppLogger.error('ShipmentTrackingRepositoryImpl - getAllShipments: Data is null');
        return Result.failure(Exception('Data is null'), StackTrace.current);
      }
    } catch (e, st) {
      AppLogger.error('ShipmentTrackingRepositoryImpl - getAllShipments: Error', e, st);
      return Result.failure(e, st);
    }
  }
}
