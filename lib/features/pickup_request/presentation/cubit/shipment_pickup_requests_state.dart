part of '../feature_imports.dart';

class ShipmentPickupRequestsState extends Equatable {
  final Async<ShipmentRequestsDataModel> getShipmentRequestsState;
  final bool isPaginationLoading;
  final bool isSearchLoading;
  final ShipmentType shipmentType;
  final String? flightType;

  const ShipmentPickupRequestsState({
    this.getShipmentRequestsState = const AsyncInitial(),
    this.isPaginationLoading = false,
    this.isSearchLoading = false,
    this.shipmentType = ShipmentType.air,
    this.flightType,
  });

  ShipmentPickupRequestsState copyWith({
    Async<ShipmentRequestsDataModel>? getShipmentRequestsState,
    bool? isPaginationLoading,
    bool? isSearchLoading,
    ShipmentType? shipmentType,
    String? flightType,
    bool clearFlightType = false,
  }) {
    return ShipmentPickupRequestsState(
      getShipmentRequestsState:
          getShipmentRequestsState ?? this.getShipmentRequestsState,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
      isSearchLoading: isSearchLoading ?? this.isSearchLoading,
      shipmentType: shipmentType ?? this.shipmentType,
      flightType: clearFlightType ? null : (flightType ?? this.flightType),
    );
  }

  @override
  List<Object?> get props => [
    getShipmentRequestsState,
    isPaginationLoading,
    isSearchLoading,
    shipmentType,
    flightType,
  ];
}
