part of '../../feature_imports.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ProfileRepo _profileRepo;
  final InternetService _internetService;

  ChangePasswordCubit(this._profileRepo, this._internetService)
    : super(const ChangePasswordState());

  Future<void> updatePassword({
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(state.copyWith(changePasswordState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          changePasswordState: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              message: LocaleKeys.no_internet_error.tr(),
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final request = UpdatePasswordRequest(
      currentPassword: currentPassword,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

    final result = await _profileRepo.updatePassword(request);

    result.when(
      onSuccess: (response) {
        emit(state.copyWith(changePasswordState: AsyncData(response)));
      },
      onFailure: (error) {
        emit(state.copyWith(changePasswordState: AsyncError(error)));
      },
    );
  }
}
