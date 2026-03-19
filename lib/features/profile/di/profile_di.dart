import 'package:almeyar/core/di/dependency_injection.dart';
import 'package:almeyar/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:almeyar/features/profile/presentation/feature_imports.dart';
import 'package:almeyar/features/profile/data/api_service/profile_api_service.dart';
import 'package:almeyar/features/profile/data/datasource/profile_datasource.dart';
import 'package:almeyar/features/profile/data/datasource/profile_datasource_impl.dart';
import 'package:almeyar/features/profile/data/repos/profile_repo.dart';
import 'package:almeyar/features/profile/data/repos/profile_repo_impl.dart';

void setupProfileDI() {
  // ApiService
  getIt.registerLazySingleton<ProfileApiService>(
    () => ProfileApiService(getIt()),
  );

  // DataSource
  getIt.registerLazySingleton<ProfileDataSource>(
    () => ProfileDataSourceImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(getIt()));

  // Cubits
  getIt.registerFactory<GiftCardsCubit>(
    () => GiftCardsCubit(getIt<ProfileRepo>(), getIt<InternetService>()),
  );

  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(
      internetService: getIt<InternetService>(),
      profileRepo: getIt<ProfileRepo>(),
    ),
  );

  getIt.registerFactory<UpdateProfileCubit>(
    () => UpdateProfileCubit(
      internetService: getIt<InternetService>(),
      profileRepo: getIt<ProfileRepo>(),
    ),
  );
}
