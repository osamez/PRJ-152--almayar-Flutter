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
  final bool isPaginationLoading;
  final int totalShipmentsCount;
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
    this.isPaginationLoading = false,
    this.totalShipmentsCount = 0,
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
    bool? isPaginationLoading,
    int? totalShipmentsCount,
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
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
      totalShipmentsCount: totalShipmentsCount ?? this.totalShipmentsCount,
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
    isPaginationLoading,
    totalShipmentsCount,
    flightType,
  ];
}
