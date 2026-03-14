part of '../../feature_imports.dart';

class ProhibitedCubit extends Cubit<ProhibitedState> {
  final HomeRepo _homeRepo;
  final InternetService _internetService;

  ProhibitedCubit(this._homeRepo, this._internetService)
    : super(const ProhibitedState());

  Future<void> getProhibitedData(ProhibitedType type) async {
    emit(state.copyWith(fetchProhibitedDataState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          fetchProhibitedDataState: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = type == ProhibitedType.air
        ? await _homeRepo.getProhibitedAir()
        : await _homeRepo.getProhibitedSea();

    result.when(
      onSuccess: (data) =>
          emit(state.copyWith(fetchProhibitedDataState: AsyncData(data))),
      onFailure: (failure) =>
          emit(state.copyWith(fetchProhibitedDataState: AsyncError(failure))),
    );
  }
}
