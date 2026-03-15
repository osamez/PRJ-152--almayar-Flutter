import 'package:almeyar/core/di/dependency_injection.dart';
import 'package:almeyar/features/pickup_request/data/api_service/pickup_request_api_service.dart';
import 'package:almeyar/features/pickup_request/data/datasource/pickup_request_datasource.dart';
import 'package:almeyar/features/pickup_request/data/datasource/pickup_request_datasource_impl.dart';
import 'package:almeyar/features/pickup_request/data/repositories/pickup_request_repo.dart';
import 'package:almeyar/features/pickup_request/data/repositories/pickup_request_repo_impl.dart';
import 'package:almeyar/features/pickup_request/presentation/feature_imports.dart';

void setupPickupRequestDI() {
  getIt.registerLazySingleton<PickupRequestApiService>(
    () => PickupRequestApiService(getIt()),
  );

  getIt.registerLazySingleton<PickupRequestDataSource>(
    () => PickupRequestDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<PickupRequestRepository>(
    () => PickupRequestRepositoryImpl(getIt()),
  );

  getIt.registerFactory<ShipmentPickupRequestsCubit>(
    () => ShipmentPickupRequestsCubit(getIt(), getIt()),
  );

  getIt.registerFactory<ReceiveShipmentCubit>(
    () => ReceiveShipmentCubit(getIt(), getIt()),
  );
}
