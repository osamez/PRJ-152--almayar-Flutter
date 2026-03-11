part of 'reset_password_cubit.dart';

class ResetPasswordState extends Equatable {
  final Async<MessageModel> resetPasswordState;

  const ResetPasswordState({
    this.resetPasswordState = const AsyncInitial(),
  });

  ResetPasswordState copyWith({
    Async<MessageModel>? resetPasswordState,
  }) {
    return ResetPasswordState(
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
    );
  }

  @override
  List<Object> get props => [resetPasswordState];
}
