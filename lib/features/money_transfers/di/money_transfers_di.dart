import 'package:almeyar/core/di/dependency_injection.dart';
import '../data/api_service/money_transfers_api_service.dart';
import '../data/datasource/money_transfers_datasource.dart';
import '../data/datasource/money_transfers_datasource_impl.dart';
import '../data/repos/money_transfers_repo.dart';
import '../data/repos/money_transfers_repo_impl.dart';
import '../presentation/feature_imports.dart';

void setupMoneyTransfersDI() {
  getIt.registerLazySingleton<MoneyTransfersApiService>(
    () => MoneyTransfersApiService(getIt()),
  );

  getIt.registerLazySingleton<MoneyTransfersDataSource>(
    () => MoneyTransfersDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<MoneyTransfersRepo>(
    () => MoneyTransfersRepoImpl(getIt()),
  );

  getIt.registerFactory<MoneyTransfersCubit>(
    () => MoneyTransfersCubit(getIt(), getIt()),
  );
}
