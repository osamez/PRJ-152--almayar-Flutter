part of '../../feature_imports.dart';

class PurchaseOrdersCubit extends Cubit<PurchaseOrdersState> {
  final PurchaseOrdersRepo _repo;
  final InternetService _internetService;

  PurchaseOrdersCubit(this._repo, this._internetService)
    : super(const PurchaseOrdersState());

  PurchaseOrdersResponseModel? _cachedData;

  Future<void> getPurchaseRequests({
    int? page,
    int? statusId,
    bool clearStatus = false,
    String? code,
    bool isRefresh = false,
    bool isPagination = false,
  }) async {
    // 1. Handle search query and caching
    if (code != null) {
      if (code.isNotEmpty &&
          (state.searchCode == null || state.searchCode!.isEmpty)) {
        _cachedData = state.getPurchaseRequestsState.valueOrNull;
      }
    }

    // 2. Handle data restoration when clearing search
    if (!isPagination && code != null && code.isEmpty && _cachedData != null) {
      final dataToRestore = _cachedData!;
      _cachedData = null;
      emit(
        state.copyWith(
          getPurchaseRequestsState: AsyncData(dataToRestore),
          orders: dataToRestore.data ?? [],
          searchCode: null,
          isSearchLoading: false,
          currentPage: (dataToRestore.meta?.currentPage ?? 1) + 1,
          hasMore:
              (dataToRestore.data?.length ?? 0) >=
              (dataToRestore.meta?.perPage ?? 10),
        ),
      );
      return;
    }

    final isNewRequest =
        page == null || page == 1 || isRefresh || (code != null);
    final targetPage = isNewRequest ? 1 : (page);

    if (isPagination) {
      if (state.isPaginationLoading || !state.hasMore) return;
      emit(state.copyWith(isPaginationLoading: true));
    } else {
      if (code != null && state.getPurchaseRequestsState.hasData) {
        emit(state.copyWith(isSearchLoading: true, searchCode: code));
      } else {
        emit(
          state.copyWith(
            getPurchaseRequestsState: const AsyncLoading(),
            selectedStatusId: statusId,
            clearSelectedStatusId: clearStatus,
            searchCode: code ?? state.searchCode,
            orders: isNewRequest ? [] : state.orders,
            currentPage: isNewRequest ? 1 : state.currentPage,
            hasMore: isNewRequest ? true : state.hasMore,
          ),
        );
      }
    }

    if (!await _internetService.isConnected()) {
      final errorState = AsyncError<PurchaseOrdersResponseModel>(
        ApiErrorModel(
          error: 'no_internet',
          status: LocalStatusCodes.connectionError,
        ),
      );
      if (isPagination) {
        emit(state.copyWith(isPaginationLoading: false));
      } else {
        emit(
          state.copyWith(
            getPurchaseRequestsState: errorState,
            isSearchLoading: false,
          ),
        );
      }
      return;
    }

    final result = await _repo.getPurchaseRequests(
      targetPage,
      clearStatus ? null : (statusId ?? state.selectedStatusId),
      code ?? state.searchCode,
    );

    result.when(
      onSuccess: (data) {
        final newOrders = data.data ?? [];
        final updatedOrders = isNewRequest
            ? newOrders
            : [...state.orders, ...newOrders];

        emit(
          state.copyWith(
            getPurchaseRequestsState: AsyncData(data),
            orders: updatedOrders,
            currentPage: targetPage + 1,
            isSearchLoading: false,
            isPaginationLoading: false,
            hasMore: newOrders.length >= (data.meta?.perPage ?? 10),
          ),
        );
      },
      onFailure: (failure) {
        if (isPagination) {
          emit(state.copyWith(isPaginationLoading: false));
        } else {
          emit(
            state.copyWith(
              getPurchaseRequestsState: AsyncError(failure),
              isSearchLoading: false,
            ),
          );
        }
      },
    );
  }

  void search(String query) {
    if (query == state.searchCode || state.isSearchLoading) return;
    getPurchaseRequests(code: query, page: 1);
  }

  void filterByStatus(int? statusId) {
    if (statusId == state.selectedStatusId) return;
    getPurchaseRequests(statusId: statusId, page: 1, clearStatus: statusId == null);
  }

  void loadMore() {
    if (!state.isPaginationLoading && state.hasMore) {
      getPurchaseRequests(page: state.currentPage, isPagination: true);
    }
  }
}
