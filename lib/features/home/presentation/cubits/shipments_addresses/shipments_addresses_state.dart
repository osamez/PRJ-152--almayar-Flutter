part of '../../feature_imports.dart';

class ShipmentsAddressesState extends Equatable {
  final Async<List<BranchModel>> getAllBranchesState;
  final Async<BranchDetailsModel> showBranchDetailsState;
  final String selectedFilter;
  final String searchQuery;
  final ShippingWay? selectedDropdownShipmentType;

  const ShipmentsAddressesState({
    this.getAllBranchesState = const AsyncInitial(),
    this.showBranchDetailsState = const AsyncInitial(),
    this.selectedFilter = 'air',
    this.searchQuery = '',
    this.selectedDropdownShipmentType,
  });

  ShipmentsAddressesState copyWith({
    Async<List<BranchModel>>? getAllBranchesState,
    Async<BranchDetailsModel>? showBranchDetailsState,
    String? selectedFilter,
    String? searchQuery,
    ShippingWay? selectedDropdownShipmentType,
  }) {
    return ShipmentsAddressesState(
      getAllBranchesState: getAllBranchesState ?? this.getAllBranchesState,
      showBranchDetailsState:
          showBranchDetailsState ?? this.showBranchDetailsState,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedDropdownShipmentType:
          selectedDropdownShipmentType ?? this.selectedDropdownShipmentType,
    );
  }

  @override
  List<Object?> get props => [
    getAllBranchesState,
    showBranchDetailsState,
    selectedFilter,
    searchQuery,
    selectedDropdownShipmentType,
  ];
}
