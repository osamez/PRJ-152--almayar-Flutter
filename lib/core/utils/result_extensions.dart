import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/async.dart';

extension ResultToAsyncExtension<T> on Result<T> {
  Async<T> toAsync() {
    return when(
      onSuccess: (data) => AsyncData(data),
      onFailure: (failure) => AsyncError(failure),
    );
  }
}

extension ResultBaseResponseToAsyncExtension<T> on Result<BaseResponse<T>> {
  Async<T> toAsyncUnwrapped() {
    return when(
      onSuccess: (response) => AsyncData(response.data as T),
      onFailure: (failure) => AsyncError(failure),
    );
  }
}
