part of '../feature_imports.dart';

class DeliveryRequestsCubit extends Cubit<DeliveryRequestsState> {
  final DeliveryRequestsRepo _deliveryRequestsRepo;
  final InternetService _internetService;

  DeliveryRequestsCubit(this._deliveryRequestsRepo, this._internetService)
    : super(const DeliveryRequestsState());

  Timer? _searchTimer;

  Future<void> getDeliveryRequestsOrders({bool loadMore = false}) async {
    if (loadMore) {
      if (state.getDeliveryRequestsOrdersState.isLoading || !state.hasMore)
        return;
      emit(state.copyWith(currentPage: state.currentPage + 1));
    } else {
      // If searching is cleared and we have cached data, restore it immediately
      if (state.searchQuery.isEmpty &&
          state.cachedDeliveryOrdersResponse != null) {
        emit(
          state.copyWith(
            getDeliveryRequestsOrdersState: AsyncData(
              state.cachedDeliveryOrdersResponse!,
            ),
            deliveryRequestsOrdersList: state.cachedDeliveryRequestsOrdersList,
            currentPage: 1,
            hasMore:
                (state.cachedDeliveryOrdersResponse?.meta?.currentPage ?? 1) <
                (state.cachedDeliveryOrdersResponse?.meta?.lastPage ?? 1),
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          getDeliveryRequestsOrdersState: const AsyncLoading(),
          deliveryRequestsOrdersList: [],
          currentPage: 1,
          hasMore: true,
        ),
      );
    }

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          getDeliveryRequestsOrdersState: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = await _deliveryRequestsRepo.getDeliveryRequestsOrders(
      code: state.searchQuery,
      type: state.selectedType,
      page: state.currentPage,
    );

    result.when(
      onSuccess: (data) {
        final newOrders = data.orders ?? [];
        final updatedList = loadMore
            ? [...state.deliveryRequestsOrdersList, ...newOrders]
            : newOrders;

        // Cache the full list (first page) when no search is active
        final isInitialLoad = !loadMore && state.searchQuery.isEmpty;

        emit(
          state.copyWith(
            getDeliveryRequestsOrdersState: AsyncData(data),
            deliveryRequestsOrdersList: updatedList,
            cachedDeliveryOrdersResponse: isInitialLoad
                ? data
                : state.cachedDeliveryOrdersResponse,
            cachedDeliveryRequestsOrdersList: isInitialLoad
                ? updatedList
                : state.cachedDeliveryRequestsOrdersList,
            hasMore: (data.meta?.currentPage ?? 1) < (data.meta?.lastPage ?? 1),
          ),
        );
      },
      onFailure: (error) => emit(
        state.copyWith(getDeliveryRequestsOrdersState: AsyncError(error)),
      ),
    );
  }

  void onSearchChanged(String query) {
    if (state.searchQuery == query) return;
    emit(state.copyWith(searchQuery: query));
    _searchTimer?.cancel();

    // If query is cleared, restore from cache immediately
    if (query.isEmpty && state.cachedDeliveryOrdersResponse != null) {
      getDeliveryRequestsOrders();
      return;
    }

    _searchTimer = Timer(const Duration(milliseconds: 500), () {
      getDeliveryRequestsOrders();
    });
  }

  void onTypeChanged(String type) {
    if (state.selectedType == type) return;
    emit(state.copyWith(selectedType: type, clearCache: true));
    getDeliveryRequestsOrders();
  }

  @override
  Future<void> close() {
    _searchTimer?.cancel();
    return super.close();
  }

  @override
  void emit(DeliveryRequestsState state) {
    if (isClosed) return;
    super.emit(state);
  }
}
