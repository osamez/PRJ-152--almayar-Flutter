import 'package:equatable/equatable.dart';
import 'package:almeyar/core/network/api_error_model.dart';

sealed class Async<T> extends Equatable {
  const Async();

  bool get hasData => this is AsyncData<T>;
  bool get isLoading => this is AsyncLoading<T>;
  bool get isError => this is AsyncError<T>;
  bool get isInitial => this is AsyncInitial<T>;
  T? get valueOrNull {
    if (this is AsyncData<T>) {
      return (this as AsyncData<T>).data;
    }
    return null;
  }

  ApiErrorModel? get errorOrNull {
    if (this is AsyncError<T>) {
      return (this as AsyncError<T>).failure;
    }
    return null;
  }

  R when<R>({
    required R Function(T data) data,
    required R Function() loading,
    required R Function(ApiErrorModel failure) error,
    required R Function() initial,
  });

  R? whenOrNull<R>({
    R Function(T data)? data,
    R Function()? loading,
    R Function(ApiErrorModel failure)? error,
    R Function()? initial,
  }) {
    return when(
      data: data ?? (_) => null as R,
      loading: loading ?? () => null as R,
      error: error ?? (_) => null as R,
      initial: initial ?? () => null as R,
    );
  }

  R maybeWhen<R>({
    R Function(T data)? data,
    R Function()? loading,
    R Function(ApiErrorModel failure)? error,
    R Function()? initial,
    required R Function() orElse,
  }) {
    return when(
      data: data ?? (_) => orElse(),
      loading: loading ?? () => orElse(),
      error: error ?? (_) => orElse(),
      initial: initial ?? () => orElse(),
    );
  }

  @override
  List<Object?> get props => [];
}

class AsyncInitial<T> extends Async<T> {
  const AsyncInitial();

  @override
  R when<R>({
    required R Function(T data) data,
    required R Function() loading,
    required R Function(ApiErrorModel failure) error,
    required R Function() initial,
  }) {
    return initial();
  }
}

class AsyncLoading<T> extends Async<T> {
  const AsyncLoading();

  @override
  R when<R>({
    required R Function(T data) data,
    required R Function() loading,
    required R Function(ApiErrorModel failure) error,
    required R Function() initial,
  }) {
    return loading();
  }
}

class AsyncData<T> extends Async<T> {
  final T data;
  const AsyncData(this.data);

  @override
  List<Object?> get props => [data];

  @override
  R when<R>({
    required R Function(T data) data,
    required R Function() loading,
    required R Function(ApiErrorModel failure) error,
    required R Function() initial,
  }) {
    return data(this.data);
  }
}

class AsyncError<T> extends Async<T> {
  final ApiErrorModel failure;
  const AsyncError(this.failure);

  @override
  List<Object?> get props => [failure];

  @override
  R when<R>({
    required R Function(T data) data,
    required R Function() loading,
    required R Function(ApiErrorModel failure) error,
    required R Function() initial,
  }) {
    return error(failure);
  }
}
