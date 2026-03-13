import 'package:almeyar/core/utils/async.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/features/auth/data/models/login_request.dart';
import 'package:almeyar/features/auth/data/models/login_response.dart';
import 'package:almeyar/features/auth/data/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(const AuthState());

  Future<void> login(LoginRequest request) async {
    emit(state.copyWith(loginState: const AsyncLoading()));

    final result = await _authRepo.login(request);

    result.when(
      onSuccess: (data) {
        emit(state.copyWith(loginState: AsyncData(data)));
      },
      onFailure: (failure) {
        emit(state.copyWith(loginState: AsyncError(failure)));
      },
    );
  }
}
