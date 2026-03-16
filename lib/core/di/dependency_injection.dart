import 'package:almeyar/core/network/dio_factory.dart';
import 'package:almeyar/core/services/image_picker_service.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:almeyar/features/auth/di/auth_di.dart';
import 'package:almeyar/features/home/di/home_di.dart';
import 'package:almeyar/features/pickup_request/di/pickup_request_di.dart';
import 'package:almeyar/features/price_calculator/di/price_calculator_di.dart';
import 'package:almeyar/features/profile/di/profile_di.dart';
import 'package:almeyar/features/shipment_tracking/di/shipment_tracking_di.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final getIt = GetIt.instance;
Future<void> setupDependencyInjection() async {
  await _initCoreDependencies();
  setupAuthDI();
  setupHomeDI();
  setupPickupRequestDI();
  setupPriceCalculatorDI();
  setupShipmentTrackingDI();
  setupProfileDI();
}

Future<void> _initCoreDependencies() async {
  //! Core
  getIt.registerLazySingleton<ImagePickerService>(() => ImagePickerService());
  getIt.registerSingleton<InternetConnection>(
    InternetConnection.createInstance(
      checkInterval: const Duration(seconds: 10),
      useDefaultOptions: false,
      customCheckOptions: [
        InternetCheckOption(uri: Uri.parse('https://www.google.com')),
        InternetCheckOption(
          uri: Uri.parse('https://cloudflare.com'),
          timeout: const Duration(seconds: 5),
        ),
      ],
    ),
  );

  getIt.registerLazySingleton<InternetService>(
    () => InternetService(internetConnection: getIt()),
  );

  // getIt.registerLazySingleton<EventBus>(() => EventBus());
  // await EnvVariables().init(
  //   type: kDebugMode ? EnvTypeEnum.prod : EnvTypeEnum.prod,
  // );
  // getIt.registerLazySingleton<EnvVariables>(() => EnvVariables());

  final dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() {
    return dio;
  });
}
