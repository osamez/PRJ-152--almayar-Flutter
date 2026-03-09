import 'package:almeyar/core/network/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// Constants for timeouts
const Duration _kConnectTimeout = Duration(minutes: 1);
const Duration _kReceiveTimeout = Duration(minutes: 1);
const Duration _kSendTimeout = Duration(
  minutes: 1,
); // Reduced to 1 min (adjust if uploading files)

class DioFactory {
  /// Private static instance variable
  static Dio? _dio;

  /// Private constructor prevents external instantiation
  DioFactory._();

  /// Global access point
  static Dio getDio() {
    // If instance exists, return it. If not, create it.
    if (_dio == null) {
      _dio = Dio();

      // 1. Base Configuration
      _dio!.options = BaseOptions(
        baseUrl: "https://api.yourdomain.com/v1", // Add your Base URL here
        connectTimeout: _kConnectTimeout,
        receiveTimeout: _kReceiveTimeout,
        sendTimeout: _kSendTimeout,
        headers: {
          'Content-Type': 'application/json', // Standard for APIs
          'Accept': 'application/json',
        },
      );

      // 2. Add Interceptors
      _dio!.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false, // Usually not needed for debugging
          error: true,
          compact: true,
          maxWidth: 90,
          enabled: kDebugMode, // Only log in debug mode
        ),
      );

      _dio!.interceptors.add(AuthInterceptor());

      // You can add other interceptors here (e.g., AuthInterceptor)
    }

    return _dio!;
  }
}
