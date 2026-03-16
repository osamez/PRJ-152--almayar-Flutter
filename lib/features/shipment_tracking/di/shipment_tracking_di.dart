import 'package:almeyar/core/di/dependency_injection.dart';
import 'package:almeyar/features/shipment_tracking/data/api_service/shipment_tracking_api_service.dart';
import 'package:almeyar/features/shipment_tracking/data/datasource/shipment_tracking_datasource.dart';
import 'package:almeyar/features/shipment_tracking/data/datasource/shipment_tracking_datasource_impl.dart';
import 'package:almeyar/features/shipment_tracking/data/repositories/shipment_tracking_repo.dart';
import 'package:almeyar/features/shipment_tracking/data/repositories/shipment_tracking_repo_impl.dart';

void setupShipmentTrackingDI() {
  getIt.registerLazySingleton<ShipmentTrackingApiService>(
    () => ShipmentTrackingApiService(getIt()),
  );

  getIt.registerLazySingleton<ShipmentTrackingDataSource>(
    () => ShipmentTrackingDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<ShipmentTrackingRepository>(
    () => ShipmentTrackingRepositoryImpl(getIt()),
  );
}
