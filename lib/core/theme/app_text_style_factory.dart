import 'package:almeyar/core/utils/app_constants.dart';
import 'package:almeyar/core/utils/exports.dart';

abstract final class AppTextStyleFactory {
  static final Map<String, TextStyle> _cache = {};

  static void initialize() {
    // No-op: kept for backward compatibility.
    // Cache is self-invalidating via computed .sp values in keys.
  }

  static TextStyle create({
    required double size,
    required FontWeight weight,
    Color color = AppColors.black,
  }) {
    final computedSize = size.sp;
    // Include computedSize in key so stale entries (e.g. fontSize 0
    // from an early frame before ScreenUtil is ready) are never reused.
    final key =
        '$computedSize-${weight.value}-${color.a}-${color.r}-${color.g}-${color.b}';
    return _cache[key] ??= TextStyle(
      fontSize: computedSize,
      fontWeight: weight,
      color: color,
      fontFamily: AppConstants.fontFamily,
    );
  }
}
