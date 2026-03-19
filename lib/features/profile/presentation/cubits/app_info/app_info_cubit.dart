part of '../../feature_imports.dart';

class AppInfoCubit extends Cubit<AppInfoState> {
  final ProfileRepo _profileRepo;
  final InternetService _internetService;

  AppInfoCubit(this._profileRepo, this._internetService) : super(const AppInfoState());

  Future<void> getAppInfo(AppInfoType type) async {
    emit(state.copyWith(infoType: type, getAppInfoState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          getAppInfoState: AsyncError(
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

    final result = await _getRepoMethod(type);

    result.when(
      onSuccess: (response) {
        emit(state.copyWith(getAppInfoState: AsyncData(response.data ?? '')));
      },
      onFailure: (error) => emit(state.copyWith(getAppInfoState: AsyncError(error))),
    );
  }

  Future<Result<BaseResponse<String>>> _getRepoMethod(AppInfoType type) {
    return switch (type) {
      AppInfoType.privacyPolicy => _profileRepo.getPrivacyPolicy(),
      AppInfoType.aboutApp => _profileRepo.getAboutApp(),
      AppInfoType.termsAndConditions => _profileRepo.getTermsAndConditions(),
    };
  }
}
