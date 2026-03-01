import 'package:almeyar/core/routing/app_router.dart';
import 'package:almeyar/core/theme/app_text_style_factory.dart';
import 'package:almeyar/core/theme/app_theme.dart';
import 'package:almeyar/core/utils/app_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlmeyarApp extends StatefulWidget {
  const AlmeyarApp({super.key});

  @override
  State<AlmeyarApp> createState() => _AlmeyarAppState();
}

class _AlmeyarAppState extends State<AlmeyarApp> {
  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 847),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        if (!_initialized) {
          AppSizes.init();
          AppTextStyleFactory.initialize();
          _initialized = true;
        }
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerConfig: router,
          theme: appTheme,
        );
      },
    );
  }
}
