import 'package:almeyar/core/network/api_error_model.dart';
import 'package:almeyar/core/network/local_status_codes.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:almeyar/core/utils/async.dart';
import 'package:almeyar/features/shipment_tracking/data/models/shipment_status_count_model.dart';
import 'package:almeyar/features/shipment_tracking/data/repositories/shipment_tracking_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:almeyar/features/shipment_tracking/data/models/shipments_type_params.dart';

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

  void changeTab(int index) {
    if (state.selectedTabIndex == index) return;
    emit(state.copyWith(selectedTabIndex: index));
  }
}
