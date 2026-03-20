import 'package:almeyar/core/di/dependency_injection.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:almeyar/features/tickets/data/api_service/tickets_api_service.dart';
import 'package:almeyar/features/tickets/data/datasources/tickets_datasource.dart';
import 'package:almeyar/features/tickets/data/datasources/tickets_datasource_impl.dart';
import 'package:almeyar/features/tickets/data/repositories/tickets_repo.dart';
import 'package:almeyar/features/tickets/data/repositories/tickets_repo_impl.dart';
import 'package:almeyar/features/tickets/presentation/feature_imports.dart';

void setupTicketsDI() {
  getIt.registerLazySingleton<TicketsApiService>(
    () => TicketsApiService(getIt()),
  );

  getIt.registerLazySingleton<TicketsDataSource>(
    () => TicketsDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<TicketsRepo>(() => TicketsRepoImpl(getIt()));

  getIt.registerFactory<TicketsCubit>(
    () => TicketsCubit(getIt<TicketsRepo>(), getIt<InternetService>()),
  );

  getIt.registerFactory<AddNewTicketCubit>(
    () => AddNewTicketCubit(getIt<TicketsRepo>(), getIt<InternetService>()),
  );

  getIt.registerFactory<TicketDetailsCubit>(
    () => TicketDetailsCubit(getIt<TicketsRepo>(), getIt<InternetService>()),
  );
}
