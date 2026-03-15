import 'package:almeyar/features/price_calculator/presentation/cubit/price_calculator_cubit.dart';
import 'package:almeyar/core/di/dependency_injection.dart';
import 'package:almeyar/features/price_calculator/data/api_service/price_calculator_api_service.dart';
import 'package:almeyar/features/price_calculator/data/datasources/price_calculator_datasource.dart';
import 'package:almeyar/features/price_calculator/data/datasources/price_calculator_datasource_impl.dart';
import 'package:almeyar/features/price_calculator/data/repositories/price_calculator_repo.dart';
import 'package:almeyar/features/price_calculator/data/repositories/price_calculator_repo_impl.dart';

void setupPriceCalculatorDI() {
  // ApiService
  getIt.registerLazySingleton<PriceCalculatorApiService>(
    () => PriceCalculatorApiService(getIt()),
  );

  // DataSource
  getIt.registerLazySingleton<PriceCalculatorDataSource>(
    () => PriceCalculatorDataSourceImpl(getIt()),
  );

  // Repo
  getIt.registerLazySingleton<PriceCalculatorRepo>(
    () => PriceCalculatorRepoImpl(getIt()),
  );

  // Cubit
  getIt.registerFactory<PriceCalculatorCubit>(() => PriceCalculatorCubit(getIt()));
}
