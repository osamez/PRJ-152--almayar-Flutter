import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/core/utils/async.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/features/auth/data/models/reset_password_request.dart';
import 'package:almeyar/features/auth/data/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo _authRepo;

  ResetPasswordCubit(this._authRepo) : super(const ResetPasswordState());

  Future<void> resetPassword(ResetPasswordRequest request) async {
    emit(state.copyWith(resetPasswordState: const AsyncLoading()));

    final result = await _authRepo.resetPassword(request);

    result.when(
      onSuccess: (data) =>
          emit(state.copyWith(resetPasswordState: AsyncData(data))),
      onFailure: (error) => emit(
        state.copyWith(
          resetPasswordState: AsyncError(error),
        ),
      ),
    );
  }
}
