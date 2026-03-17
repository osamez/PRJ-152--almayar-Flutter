part of '../../feature_imports.dart';

class ShoppingSitesCubit extends Cubit<ShoppingSitesState> {
  final PurchaseOrdersRepo _repo;
  final InternetService _internetService;

  ShoppingSitesCubit(this._repo, this._internetService)
      : super(const ShoppingSitesState());

  Future<void> getShoppingSites({String? name, int page = 1}) async {
    // If name is empty, we are either loading initial or clearing search
    if (name == null || name.isEmpty) {
      if (state.cachedShoppingSites != null && page == 1) {
        emit(state.copyWith(
          getShoppingSitesState: AsyncData(state.cachedShoppingSites!),
          sitesList: state.cachedShoppingSites!.sites ?? [],
          searchQuery: '',
          currentPage: 1,
          hasMore: state.cachedShoppingSites!.meta?.currentPage !=
              state.cachedShoppingSites!.meta?.lastPage,
        ));
        return;
      }
    }

    if (page == 1) {
      emit(state.copyWith(
        getShoppingSitesState: const AsyncLoading(),
        searchQuery: name ?? '',
        currentPage: page,
        isPaginationLoading: false,
      ));
    } else {
      emit(state.copyWith(isPaginationLoading: true));
    }

    if (!await _internetService.isConnected()) {
      final error = AsyncError<ShoppingSitesResponseModel>(
        ApiErrorModel(
          error: LocaleKeys.no_internet_error.tr(),
          status: LocalStatusCodes.connectionError,
        ),
      );
      emit(
        state.copyWith(
          getShoppingSitesState: page == 1 ? error : state.getShoppingSitesState,
          isPaginationLoading: false,
        ),
      );
      return;
    }

    final result = await _repo.getShoppingSites(name, page);

    result.when(
      onSuccess: (data) {
        final responseData = data.data;
        if (responseData != null) {
          final newSites = responseData.sites ?? [];
          final updatedSitesList =
              page == 1 ? newSites : [...state.sitesList, ...newSites];

          final meta = responseData.meta;
          final hasMore = (meta?.currentPage ?? page) < (meta?.lastPage ?? page);

          emit(state.copyWith(
            getShoppingSitesState: AsyncData(responseData),
            sitesList: updatedSitesList,
            currentPage: meta?.currentPage ?? page,
            hasMore: hasMore,
            isPaginationLoading: false,
            cachedShoppingSites: (name == null || name.isEmpty && page == 1)
                ? responseData
                : state.cachedShoppingSites,
          ));
        } else {
          emit(state.copyWith(
            getShoppingSitesState: page == 1
                ? AsyncError(ApiErrorModel(error: 'No data'))
                : state.getShoppingSitesState,
            isPaginationLoading: false,
          ));
        }
      },
      onFailure: (error) => emit(state.copyWith(
        getShoppingSitesState:
            page == 1 ? AsyncError(error) : state.getShoppingSitesState,
        isPaginationLoading: false,
      )),
    );
  }

  Future<void> loadMoreShoppingSites() async {
    if (state.getShoppingSitesState.isLoading ||
        state.isPaginationLoading ||
        !state.hasMore) return;
    await getShoppingSites(
      name: state.searchQuery,
      page: state.currentPage + 1,
    );
  }
}
