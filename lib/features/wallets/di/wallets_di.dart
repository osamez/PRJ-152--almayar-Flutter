import 'package:almeyar/core/di/dependency_injection.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:almeyar/features/wallets/data/api_service/wallets_api_service.dart';
import 'package:almeyar/features/wallets/data/datasource/wallets_datasource.dart';
import 'package:almeyar/features/wallets/data/datasource/wallets_datasource_impl.dart';
import 'package:almeyar/features/wallets/data/repos/wallets_repo.dart';
import 'package:almeyar/features/wallets/data/repos/wallets_repo_impl.dart';
import 'package:almeyar/features/wallets/presentation/cubits/wallets/wallets_cubit.dart';
import 'package:dio/dio.dart';

void setupWalletsDI() {
  getIt.registerLazySingleton<WalletsApiService>(
    () => WalletsApiService(getIt<Dio>()),
  );

  getIt.registerLazySingleton<WalletsDataSource>(
    () => WalletsDataSourceImpl(getIt<WalletsApiService>()),
  );

  getIt.registerLazySingleton<WalletsRepo>(
    () => WalletsRepoImpl(getIt<WalletsDataSource>()),
  );

  getIt.registerFactory<WalletsCubit>(
    () => WalletsCubit(getIt<WalletsRepo>(), getIt<InternetService>()),
  );
}
