import 'package:almeyar/core/network/api_error_model.dart';
import 'package:dio/dio.dart';

extension DioExceptionTypeExtension on DioException {
  ApiErrorModel when({
    required ApiErrorModel Function() connectionError,
    required ApiErrorModel Function() connectionTimeout,
    required ApiErrorModel Function() sendTimeout,
    required ApiErrorModel Function() receiveTimeout,
    required ApiErrorModel Function() badCertificate,
    required ApiErrorModel Function(Response? response) badResponse,
    required ApiErrorModel Function() cancel,
    required ApiErrorModel Function() unknown,
  }) {
    return switch (type) {
      DioExceptionType.connectionError => connectionError(),
      DioExceptionType.connectionTimeout => connectionTimeout(),
      DioExceptionType.sendTimeout => sendTimeout(),
      DioExceptionType.receiveTimeout => receiveTimeout(),
      DioExceptionType.badCertificate => badCertificate(),
      DioExceptionType.badResponse => badResponse(response),
      DioExceptionType.cancel => cancel(),
      DioExceptionType.unknown => unknown(),
    };
  }
}
