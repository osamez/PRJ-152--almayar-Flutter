import 'package:almeyar/core/network/api_error_handler.dart';
import 'package:almeyar/core/network/api_error_model.dart';

sealed class Result<T> {
  const Result();

  factory Result.success(T data) = Success<T>;
  factory Result.failure(Object error, [StackTrace? stackTrace]) {
    final ApiErrorModel failure = ApiErrorHandler.handle(error);
    return Error<T>(failure);
  }
  R when<R>({
    required R Function(T data) onSuccess,
    required R Function(ApiErrorModel failure) onFailure,
  }) {
    switch (this) {
      case Success(
        data: final d,
      ): // Pattern Matching أو تحديداً Object Destructuring.
        return onSuccess(d);

      case Error(failure: final f):
        return onFailure(f);
    }
  }
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends Result<T> {
  final ApiErrorModel failure;
  const Error(this.failure);
}
