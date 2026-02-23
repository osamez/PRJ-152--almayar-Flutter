import 'package:almeyar/core/utils/app_constants.dart';
import 'package:almeyar/core/utils/exports.dart';

abstract final class AppTextStyleFactory {
  static late Map<String, TextStyle> _cache;

  static void initialize() {
    _cache = {};
  }

  static TextStyle create({
    required double size,
    required FontWeight weight,
    Color color = AppColors.black,
  }) {
    final key = '$size-${weight.value}-${color.toString()}';
    return _cache[key] ??= TextStyle(
      fontSize: size.sp,
      fontWeight: weight,
      color: color,
      fontFamily: AppConstants.fontFamily,
    );
  }
}
