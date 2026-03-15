import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/features/pickup_request/data/datasource/pickup_request_datasource.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_category_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_content_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_request_model.dart';
import 'pickup_request_repo.dart';

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

  @override
  Future<Result<List<ShipmentContentModel>>> getShipmentContents() async {
    try {
      final response = await _dataSource.getShipmentContents();
      if (response.data != null) {
        AppLogger.info(
          'PickupRequestRepositoryImpl - getShipmentContents: Success',
        );
        return Result.success(response.data!);
      } else {
        AppLogger.error(
          'PickupRequestRepositoryImpl - getShipmentContents: Data is null',
        );
        return Result.failure(Exception('Data is null'), StackTrace.current);
      }
    } catch (e, st) {
      AppLogger.error(
        'PickupRequestRepositoryImpl - getShipmentContents: Error',
        e,
        st,
      );
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<List<ShipmentCategoryModel>>> getShipmentCategories() async {
    try {
      final response = await _dataSource.getShipmentCategories();
      if (response.data != null) {
        AppLogger.info(
          'PickupRequestRepositoryImpl - getShipmentCategories: Success',
        );
        return Result.success(response.data!);
      } else {
        AppLogger.error(
          'PickupRequestRepositoryImpl - getShipmentCategories: Data is null',
        );
        return Result.failure(Exception('Data is null'), StackTrace.current);
      }
    } catch (e, st) {
      AppLogger.error(
        'PickupRequestRepositoryImpl - getShipmentCategories: Error',
        e,
        st,
      );
      return Result.failure(e, st);
    }
  }
}
