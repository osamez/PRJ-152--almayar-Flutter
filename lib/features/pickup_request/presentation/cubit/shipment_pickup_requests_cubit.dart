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
    // تحديد هل العملية هي بحث (أو مسح للبحث) بناءً على وجود قيمة
    final isSearchAction = trackingNumber != null;
    final queryForApi = (isSearchAction && trackingNumber.isEmpty)
        ? null
        : trackingNumber;

    // 1. استرجاع الداتا من الكاش لو اليوزر مسح السيرش
    if (!isPagination &&
        isSearchAction &&
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
      // 2. حفظ الداتا في الكاش قبل ما نبدأ بحث جديد
      if (isSearchAction &&
          trackingNumber.isNotEmpty &&
          (_currentSearchQuery == null || _currentSearchQuery!.isEmpty)) {
        _cachedData = state.getShipmentRequestsState.valueOrNull;
      }

      _currentPage = 1;
      _currentSearchQuery = queryForApi; // تخزين القيمة النهائية للـ API

      // 3. تحديد شكل الـ Loading
      if (isSearchAction && state.getShipmentRequestsState.hasData) {
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

  void searchByTrackingNumber(String query) {
    getShipmentRequests(trackingNumber: query);
  }

  Future<void> refresh() async {
    await getShipmentRequests(trackingNumber: _currentSearchQuery);
  }
}
