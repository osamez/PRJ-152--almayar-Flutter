part of '../../feature_imports.dart';

class AddPurchaseOrderCubit extends Cubit<AddPurchaseOrderState> {
  final PurchaseOrdersRepo _repo;
  final InternetService _internetService;

  AddPurchaseOrderCubit(this._repo, this._internetService)
    : super(const AddPurchaseOrderState());

  /// Fetches wallets only — shopping sites load lazily via the dropdown.
  Future<void> initAdditionData() async {
    await getMyWallets();
  }

  Future<void> getMyWallets() async {
    emit(state.copyWith(getMyWalletsState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          getMyWalletsState: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = await _repo.getMyWallets();

    result.when(
      onSuccess: (response) {
        emit(state.copyWith(getMyWalletsState: AsyncData(response.data!)));
      },
      onFailure: (error) {
        emit(state.copyWith(getMyWalletsState: AsyncError(error)));
      },
    );
  }

  /// Fetches shopping sites for the dropdown.
  /// - [page] == 1  → resets the accumulated list (new search or first open).
  /// - [page] >  1  → appends to the existing list (load more).
  Future<void> getShoppingSites({String? name, int page = 1}) async {
    emit(state.copyWith(getShoppingSitesState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          getShoppingSitesState: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = await _repo.getShoppingSites(name, page);

    result.when(
      onSuccess: (response) {
        final newItems = response.data?.sites ?? [];
        final meta = response.data?.meta;
        final currentPage = meta?.currentPage ?? page;
        final lastPage = meta?.lastPage ?? page;

        final updatedList = page == 1
            ? newItems
            : [...state.shoppingSitesList, ...newItems];

        emit(
          state.copyWith(
            getShoppingSitesState: AsyncData(response.data!),
            shoppingSitesList: updatedList,
            shoppingSitesPage: currentPage,
            shoppingSitesHasMore: currentPage < lastPage,
          ),
        );
      },
      onFailure: (error) {
        emit(state.copyWith(getShoppingSitesState: AsyncError(error)));
      },
    );
  }

  /// Loads the next page of shopping sites — no-op if already loading or no more pages.
  Future<void> loadMoreShoppingSites({String? name}) async {
    if (state.getShoppingSitesState.isLoading || !state.shoppingSitesHasMore) {
      return;
    }
    await getShoppingSites(name: name, page: state.shoppingSitesPage + 1);
  }

  Future<void> addPurchaseRequest(AddPurchaseRequestModel request) async {
    emit(state.copyWith(addPurchaseRequestState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          addPurchaseRequestState: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = await _repo.addPurchaseRequest(request);

    result.when(
      onSuccess: (data) {
        emit(state.copyWith(addPurchaseRequestState: AsyncData(data)));
      },
      onFailure: (error) {
        emit(state.copyWith(addPurchaseRequestState: AsyncError(error)));
      },
    );
  }

  void selectWallet(WalletModel? wallet) {
    emit(state.copyWith(selectedWallet: wallet));
  }

  void selectShoppingSite(ShoppingSiteModel? site) {
    emit(state.copyWith(selectedShoppingSite: site));
  }
}
