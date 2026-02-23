import 'package:almeyar/core/routing/app_router.dart';
import 'package:almeyar/core/theme/app_text_style_factory.dart';
import 'package:almeyar/core/theme/app_theme.dart';
import 'package:almeyar/core/utils/app_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlmeyarApp extends StatelessWidget {
  const AlmeyarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 847),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerConfig: router,
          builder: (_, widget) {
            AppSizes.init();
            AppTextStyleFactory.initialize();
            return Theme(data: appTheme, child: widget!);
          },
        );
      },
    );
  }
}
