import 'package:almeyar/core/di/dependency_injection.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:almeyar/features/purchase_orders/data/api_service/purchase_orders_api_service.dart';
import 'package:almeyar/features/purchase_orders/data/datasource/purchase_orders_datasource.dart';
import 'package:almeyar/features/purchase_orders/data/datasource/purchase_orders_datasource_impl.dart';
import 'package:almeyar/features/purchase_orders/data/repos/purchase_orders_repo.dart';
import 'package:almeyar/features/purchase_orders/data/repos/purchase_orders_repo_impl.dart';
import 'package:almeyar/features/purchase_orders/presentation/cubits/purchase_orders/purchase_orders_cubit.dart';
import 'package:dio/dio.dart';

void setupPurchaseOrdersDI() {
  getIt.registerLazySingleton<PurchaseOrdersApiService>(
    () => PurchaseOrdersApiService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<PurchaseOrdersDataSource>(
    () => PurchaseOrdersDataSourceImpl(getIt<PurchaseOrdersApiService>()),
  );

  getIt.registerLazySingleton<PurchaseOrdersRepo>(
    () => PurchaseOrdersRepoImpl(getIt<PurchaseOrdersDataSource>()),
  );

  getIt.registerFactory<PurchaseOrdersCubit>(
    () => PurchaseOrdersCubit(
      getIt<PurchaseOrdersRepo>(),
      getIt<InternetService>(),
    ),
  );
}
