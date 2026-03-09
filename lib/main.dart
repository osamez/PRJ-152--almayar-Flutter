import 'package:almeyar/almeyar_app.dart';
import 'package:almeyar/core/di/dependency_injection.dart';
import 'package:almeyar/core/helpers/cache_helper.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setupDependencyInjection();
  await CacheHelper().init();
  AppLogger.init(isEnabled: kDebugMode);

  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/lang',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),

      child: const AlmeyarApp(),
    ),
  );
}

/// dart run easy_localization:generate -f keys -o locale_keys.g.dart -S assets/lang
/// dart run easy_localization:generate -S assets/lang
/// dart run build_runner build --delete-conflicting-outputs
