import 'package:almeyar/core/di/dependency_injection.dart';
import 'package:almeyar/features/delivery_requests/data/api_service/delivery_requests_api_service.dart';
import 'package:almeyar/features/delivery_requests/data/datasource/delivery_requests_datasource.dart';
import 'package:almeyar/features/delivery_requests/data/datasource/delivery_requests_datasource_impl.dart';
import 'package:almeyar/features/delivery_requests/data/repos/delivery_requests_repo.dart';
import 'package:almeyar/features/delivery_requests/data/repos/delivery_requests_repo_impl.dart';

void setupDeliveryRequestsDI() {
  getIt.registerLazySingleton<DeliveryRequestsApiService>(
    () => DeliveryRequestsApiService(getIt()),
  );

  getIt.registerLazySingleton<DeliveryRequestsDataSource>(
    () => DeliveryRequestsDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<DeliveryRequestsRepo>(
    () => DeliveryRequestsRepoImpl(getIt()),
  );
}
