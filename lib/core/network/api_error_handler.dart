import 'package:almeyar/core/network/api_error_model.dart';
import 'package:almeyar/core/network/dio_exception_type_extension.dart';
import 'package:almeyar/core/network/local_status_codes.dart';
import 'package:dio/dio.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic e) {
    if (e is Exception) {
      if (e is DioException) {
        return e.when(
          connectionError: () => ApiErrorModel(
            error:
                "No internet connection. Please check your Wi-Fi or mobile data.",
            status: LocalStatusCodes.connectionError,
          ),
          connectionTimeout: () => ApiErrorModel(
            error:
                "The connection took too long. Try checking your internet or try again later.",
            status: LocalStatusCodes.connectionTimeout,
          ),
          sendTimeout: () => ApiErrorModel(
            error: "Request timed out while sending data. Please try again.",
            status: LocalStatusCodes.sendTimeout,
          ),
          receiveTimeout: () => ApiErrorModel(
            error: "Server took too long to respond. Please try again later.",
            status: LocalStatusCodes.receiveTimeout,
          ),
          badCertificate: () => ApiErrorModel(
            error:
                "Security issue detected with the server. Connection not secure.",
            status: LocalStatusCodes.badCertificate,
          ),
          badResponse: (response) {
            return ApiErrorModel(
              status: response?.statusCode,
              message: response?.data["message"],
              error: response?.data["error"],
            );
          },
          cancel: () => ApiErrorModel(
            error: "The request was cancelled. Please try again.",
            status: LocalStatusCodes.cancel,
          ),
          unknown: () => ApiErrorModel(
            error:
                "Something went wrong. Please check your connection and try again.",
            status: LocalStatusCodes.unknown,
          ),
        );
      }
    }
    return ApiErrorModel(
      error:
          "Something went wrong. Please check your connection and try again.",
      status: LocalStatusCodes.unknown,
    );
  }
}
