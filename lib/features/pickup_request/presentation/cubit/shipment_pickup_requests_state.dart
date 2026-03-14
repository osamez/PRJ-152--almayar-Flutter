part of '../feature_imports.dart';

class ShipmentPickupRequestsState extends Equatable {
  final Async<ShipmentRequestsDataModel> getShipmentRequestsState;
  final bool isPaginationLoading;
  final bool isSearchLoading;

  const ShipmentPickupRequestsState({
    this.getShipmentRequestsState = const AsyncInitial(),
    this.isPaginationLoading = false,
    this.isSearchLoading = false,
  });

  ShipmentPickupRequestsState copyWith({
    Async<ShipmentRequestsDataModel>? getShipmentRequestsState,
    bool? isPaginationLoading,
    bool? isSearchLoading,
  }) {
    return ShipmentPickupRequestsState(
      getShipmentRequestsState:
          getShipmentRequestsState ?? this.getShipmentRequestsState,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
      isSearchLoading: isSearchLoading ?? this.isSearchLoading,
    );
  }

  @override
  List<Object?> get props =>
      [getShipmentRequestsState, isPaginationLoading, isSearchLoading];
}
