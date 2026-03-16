part of '../../feature_imports.dart';

class GiftCardsCubit extends Cubit<GiftCardsState> {
  final ProfileRepo _profileRepo;
  final InternetService _internetService;

  GiftCardsCubit(this._profileRepo, this._internetService)
    : super(const GiftCardsState());

  Future<void> getGiftCards() async {
    emit(state.copyWith(getGiftCardsState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          getGiftCardsState: AsyncError(
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

    final result = await _profileRepo.getGiftCards();

    result.when(
      onSuccess: (response) {
        final data = response.data ?? [];
        emit(state.copyWith(getGiftCardsState: AsyncData(data)));
      },
      onFailure: (error) => emit(state.copyWith(getGiftCardsState: AsyncError(error))),
    );
  }
}
