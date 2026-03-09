import 'package:almeyar/core/di/dependency_injection.dart';
import 'package:almeyar/features/auth/data/api_service/auth_api_service.dart';
import 'package:almeyar/features/auth/data/datasources/auth_datasource.dart';
import 'package:almeyar/features/auth/data/datasources/auth_datasource_impl.dart';
import 'package:almeyar/features/auth/data/repositories/auth_repo.dart';
import 'package:almeyar/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:almeyar/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:dio/dio.dart';

void setupAuthDI() {
  getIt.registerLazySingleton<AuthApiService>(
    () => AuthApiService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(getIt<AuthApiService>()),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<AuthDataSource>()),
  );

  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));
}
