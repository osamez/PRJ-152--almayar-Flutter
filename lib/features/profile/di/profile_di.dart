import 'package:almeyar/core/di/dependency_injection.dart';
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
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(getIt()),
  );
}
