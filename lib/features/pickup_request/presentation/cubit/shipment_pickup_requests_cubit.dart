part of '../feature_imports.dart';

class ShipmentPickupRequestsCubit extends Cubit<ShipmentPickupRequestsState> {
  final PickupRequestRepository _repository;
  final InternetService _internetService;

  ShipmentPickupRequestsCubit(this._repository, this._internetService)
    : super(const ShipmentPickupRequestsState());

  int _currentPage = 1;
  String? _currentSearchQuery;
  ShipmentRequestsDataModel? _cachedData;

  Future<void> getShipmentRequests({
    String? trackingNumber,
    bool isPagination = false,
  }) async {
    // 1. Update search query ONLY if explicitly provided
    if (trackingNumber != null) {
      // 2. Cache data when starting a new search from scratch
      if (trackingNumber.isNotEmpty &&
          (_currentSearchQuery == null || _currentSearchQuery!.isEmpty)) {
        _cachedData = state.getShipmentRequestsState.valueOrNull;
      }
      _currentSearchQuery = trackingNumber.isEmpty ? null : trackingNumber;
      _currentPage = 1;
    }

    // 3. Handle data restoration from cache when clearing search
    if (!isPagination &&
        trackingNumber != null &&
        trackingNumber.isEmpty &&
        _cachedData != null) {
      _currentSearchQuery = null;
      _currentPage = _cachedData?.meta?.currentPage ?? 1;
      final dataToRestore = _cachedData!;
      _cachedData = null;
      emit(
        state.copyWith(
          getShipmentRequestsState: AsyncData(dataToRestore),
          isSearchLoading: false,
        ),
      );
      return;
    }

    if (isPagination) {
      final meta = state.getShipmentRequestsState.valueOrNull?.meta;
      if (state.isPaginationLoading ||
          meta == null ||
          (meta.currentPage ?? 0) >= (meta.lastPage ?? 0)) {
        return;
      }
      emit(state.copyWith(isPaginationLoading: true));
      _currentPage++;
    } else {
      // 3. تحديد شكل الـ Loading
      if (trackingNumber != null && state.getShipmentRequestsState.hasData) {
        emit(state.copyWith(isSearchLoading: true));
      } else {
        emit(state.copyWith(getShipmentRequestsState: const AsyncLoading()));
      }
    }

    if (!await _internetService.isConnected()) {
      final error = ApiErrorModel(
        error: 'no_internet',
        status: LocalStatusCodes.connectionError,
      );
      if (isPagination) {
        emit(state.copyWith(isPaginationLoading: false));
      } else {
        emit(
          state.copyWith(
            getShipmentRequestsState: AsyncError(error),
            isSearchLoading: false,
          ),
        );
      }
      return;
    }

    final result = await _repository.getShipmentRequests(
      trackingNumber: _currentSearchQuery,
      shipmentType: state.shipmentType.name,
      flightType: state.flightType,
      page: _currentPage,
    );

    result.when(
      onSuccess: (newData) {
        if (isPagination) {
          final currentData = state.getShipmentRequestsState.valueOrNull;
          if (currentData != null) {
            final updatedRequests = List<ShipmentRequestModel>.from(
              currentData.requests ?? [],
            )..addAll(newData.requests ?? []);

            emit(
              state.copyWith(
                getShipmentRequestsState: AsyncData(
                  ShipmentRequestsDataModel(
                    requests: updatedRequests,
                    meta: newData.meta,
                  ),
                ),
                isPaginationLoading: false,
              ),
            );
          } else {
            emit(
              state.copyWith(
                getShipmentRequestsState: AsyncData(newData),
                isPaginationLoading: false,
              ),
            );
          }
        } else {
          emit(
            state.copyWith(
              getShipmentRequestsState: AsyncData(newData),
              isSearchLoading: false,
            ),
          );
        }
      },
      onFailure: (error) {
        if (isPagination) {
          emit(state.copyWith(isPaginationLoading: false));
          _currentPage--; // Revert page increment on failure
        } else {
          emit(
            state.copyWith(
              getShipmentRequestsState: AsyncError(error),
              isSearchLoading: false,
            ),
          );
        }
      },
    );
  }

  Future<void> changeShipmentType(ShipmentType type) async {
    if (state.shipmentType == type) return;
    emit(state.copyWith(shipmentType: type, clearFlightType: true));
    await getShipmentRequests();
  }

  Future<void> applyFlightTypeFilter(String? flightType) async {
    if (state.flightType == flightType) return;
    if (flightType == null) {
      emit(state.copyWith(clearFlightType: true));
    } else {
      emit(state.copyWith(flightType: flightType));
    }
    await getShipmentRequests();
  }

  void searchByTrackingNumber(String query) {
    getShipmentRequests(trackingNumber: query);
  }

  Future<void> refresh() async {
    await getShipmentRequests(trackingNumber: _currentSearchQuery);
  }
}
