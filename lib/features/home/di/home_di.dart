import 'package:almeyar/features/home/presentation/feature_imports.dart';

void setupHomeDI() {
  getIt.registerLazySingleton<HomeApiService>(
    () => HomeApiService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(getIt<HomeApiService>()),
  );

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(getIt<HomeDataSource>()),
  );

  getIt.registerFactory<ProhibitedCubit>(
    () => ProhibitedCubit(getIt<HomeRepo>(), getIt<InternetService>()),
  );
  getIt.registerFactory<ShipmentsAddressesCubit>(
    () => ShipmentsAddressesCubit(getIt<HomeRepo>(), getIt<InternetService>()),
  );
}
