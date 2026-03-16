part of 'shipment_tracking_cubit.dart';

class ShipmentTrackingState extends Equatable {
  final int selectedTabIndex;
  final Async<List<ShipmentStatusCountModel>> shipmentStatusCounts;
  final ShipmentStatusModel? selectedStatus;

  const ShipmentTrackingState({
    this.selectedTabIndex = 0,
    this.shipmentStatusCounts = const AsyncInitial(),
    this.selectedStatus,
  });

  ShipmentTrackingState copyWith({
    int? selectedTabIndex,
    Async<List<ShipmentStatusCountModel>>? shipmentStatusCounts,
    ShipmentStatusModel? selectedStatus,
  }) {
    return ShipmentTrackingState(
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      shipmentStatusCounts: shipmentStatusCounts ?? this.shipmentStatusCounts,
      selectedStatus: selectedStatus ?? this.selectedStatus,
    );
  }

  @override
  List<Object?> get props =>
      [selectedTabIndex, shipmentStatusCounts, selectedStatus];
}


