part of 'shipment_tracking_cubit.dart';

class ShipmentTrackingState extends Equatable {
  final int selectedTabIndex;
  final Async<List<ShipmentStatusCountModel>> shipmentStatusCounts;
  final Async<List<ShipmentModel>> shipments;
  final List<ShipmentModel> cachedShipments;
  final ShipmentStatusModel? selectedStatus;
  final String searchKeyword;
  final int currentPage;
  final bool hasReachedMax;
  final String? flightType;

  const ShipmentTrackingState({
    this.selectedTabIndex = 0,
    this.shipmentStatusCounts = const AsyncInitial(),
    this.shipments = const AsyncInitial(),
    this.cachedShipments = const [],
    this.selectedStatus,
    this.searchKeyword = '',
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.flightType,
  });

  ShipmentTrackingState copyWith({
    int? selectedTabIndex,
    Async<List<ShipmentStatusCountModel>>? shipmentStatusCounts,
    Async<List<ShipmentModel>>? shipments,
    List<ShipmentModel>? cachedShipments,
    ShipmentStatusModel? selectedStatus,
    String? searchKeyword,
    int? currentPage,
    bool? hasReachedMax,
    String? flightType,
    bool clearSelectedStatus = false,
    bool clearFlightType = false,
  }) {
    return ShipmentTrackingState(
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      shipmentStatusCounts: shipmentStatusCounts ?? this.shipmentStatusCounts,
      shipments: shipments ?? this.shipments,
      cachedShipments: cachedShipments ?? this.cachedShipments,
      selectedStatus: clearSelectedStatus ? null : (selectedStatus ?? this.selectedStatus),
      searchKeyword: searchKeyword ?? this.searchKeyword,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      flightType: clearFlightType ? null : (flightType ?? this.flightType),
    );
  }

  @override
  List<Object?> get props => [
    selectedTabIndex,
    shipmentStatusCounts,
    shipments,
    cachedShipments,
    selectedStatus,
    searchKeyword,
    currentPage,
    hasReachedMax,
    flightType,
  ];
}
