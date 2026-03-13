import 'package:almeyar/core/di/dependency_injection.dart';
import 'package:almeyar/features/home/data/api_service/home_api_service.dart';
import 'package:almeyar/features/home/data/datasource/home_datasource.dart';
import 'package:almeyar/features/home/data/datasource/home_datasource_impl.dart';
import 'package:almeyar/features/home/data/repos/home_repo.dart';
import 'package:almeyar/features/home/data/repos/home_repo_impl.dart';
import 'package:almeyar/features/home/presentation/cubits/prohibited_cubit.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:dio/dio.dart';

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
}
