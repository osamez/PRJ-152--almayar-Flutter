import 'package:almeyar/core/helpers/cache_helper.dart';

import 'package:almeyar/core/routing/app_router.dart';
import 'package:almeyar/core/routing/routes.dart';
import 'package:almeyar/core/utils/prefs_keys.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await CacheHelper.getSecuredString(PrefsKeys.token);

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // كمل يا باشا الـ request بتاعتك عادي
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      router.go(Routes.login);
    }
    return super.onError(err, handler);
  }
}
