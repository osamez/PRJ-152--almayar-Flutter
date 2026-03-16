import 'package:almeyar/core/network/api_error_model.dart';
import 'package:almeyar/core/network/local_status_codes.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:almeyar/core/utils/async.dart';
import 'package:almeyar/features/shipment_tracking/data/models/shipment_status_count_model.dart';
import 'package:almeyar/features/shipment_tracking/data/models/shipment_tracking_model.dart';
import 'package:almeyar/features/shipment_tracking/data/models/shipments_type_params.dart';
import 'package:almeyar/features/shipment_tracking/data/repositories/shipment_tracking_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shipment_tracking_state.dart';

class ShipmentTrackingCubit extends Cubit<ShipmentTrackingState> {
  final ShipmentTrackingRepository _repository;
  final InternetService _internetService;

  ShipmentTrackingCubit(
    this._repository,
    this._internetService, {
    ShipmentsTypeParams? initialParams,
  }) : super(
         ShipmentTrackingState(
           selectedTabIndex: initialParams?.selectedTabIndex ?? 0,
           selectedStatus: initialParams?.status,
         ),
       );

  void initialize() {
    getShipmentStatusCounts();
    getAllShipments();
  }

  Future<void> getShipmentStatusCounts() async {
    emit(state.copyWith(shipmentStatusCounts: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          shipmentStatusCounts: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final shipmentType = state.selectedTabIndex == 0 ? 'air' : 'sea';
    final result = await _repository.getShipmentStatusCounts(
      shipmentType: shipmentType,
    );

    result.when(
      onSuccess: (data) =>
          emit(state.copyWith(shipmentStatusCounts: AsyncData(data))),
      onFailure: (error) =>
          emit(state.copyWith(shipmentStatusCounts: AsyncError(error))),
    );
  }

  Future<void> getAllShipments({bool isPagination = false}) async {
    if (isPagination) {
      if (state.hasReachedMax || state.shipments is AsyncLoading) return;
    } else {
      emit(
        state.copyWith(
          shipments: const AsyncLoading(),
          currentPage: 1,
          hasReachedMax: false,
        ),
      );
    }

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          shipments: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final shipmentType = state.selectedTabIndex == 0 ? 'air' : 'sea';
    final result = await _repository.getAllShipments(
      type: shipmentType,
      status: state.selectedStatus?.id?.toString(),
      code: state.searchKeyword.isEmpty ? null : state.searchKeyword,
      page: state.currentPage,
      flightType: state.flightType,
    );

    result.when(
      onSuccess: (data) {
        final List<ShipmentModel> currentShipments = isPagination
            ? [
                ...(state.shipments.valueOrNull ?? []),
                ...(data.shipments ?? []),
              ]
            : (data.shipments ?? []);

        final bool hasReachedMax =
            data.meta?.currentPage == data.meta?.lastPage;

        emit(
          state.copyWith(
            shipments: AsyncData(currentShipments),
            cachedShipments: state.searchKeyword.isEmpty
                ? currentShipments
                : state.cachedShipments,
            currentPage: (data.meta?.currentPage ?? state.currentPage) + 1,
            hasReachedMax: hasReachedMax,
          ),
        );
      },
      onFailure: (error) => emit(state.copyWith(shipments: AsyncError(error))),
    );
  }

  void searchShipments(String query) {
    if (query == state.searchKeyword) return;

    final List<ShipmentModel> cached = state.searchKeyword.isEmpty
        ? (state.shipments.valueOrNull ?? [])
        : state.cachedShipments;

    emit(state.copyWith(searchKeyword: query, cachedShipments: cached));

    if (query.isEmpty) {
      emit(state.copyWith(shipments: AsyncData(state.cachedShipments)));
    } else {
      getAllShipments();
    }
  }

  void updateStatusFilter(ShipmentStatusModel? status) {
    if (state.selectedStatus == status) return;
    emit(state.copyWith(selectedStatus: status));
    getAllShipments();
  }

  void changeTab(int index) {
    if (index == state.selectedTabIndex) return;

    emit(state.copyWith(selectedTabIndex: index, clearFlightType: true));
    getShipmentStatusCounts();
    getAllShipments();
  }

  void applyFlightTypeFilter(String? flightType) {
    if (state.flightType == flightType) return;
    emit(state.copyWith(flightType: flightType));
    getAllShipments();
  }
}
