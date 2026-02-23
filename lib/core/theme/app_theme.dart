import 'package:almeyar/core/theme/app_colors.dart';
import 'package:almeyar/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: AppConstants.fontFamily,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.orange,
    brightness: Brightness.light,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: AppColors.black,
    displayColor: AppColors.black,
  ),
  // extensions: [AppTypography.initial],
);
