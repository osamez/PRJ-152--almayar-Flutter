part of '../../feature_imports.dart';

class ChangePasswordState extends Equatable {
  final Async<MessageResponse> changePasswordState;

  const ChangePasswordState({
    this.changePasswordState = const AsyncInitial(),
  });

  ChangePasswordState copyWith({
    Async<MessageResponse>? changePasswordState,
  }) {
    return ChangePasswordState(
      changePasswordState: changePasswordState ?? this.changePasswordState,
    );
  }

  @override
  List<Object> get props => [changePasswordState];
}
