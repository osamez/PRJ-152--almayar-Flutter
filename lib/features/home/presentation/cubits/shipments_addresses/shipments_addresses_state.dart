part of '../../feature_imports.dart';

class ShipmentsAddressesState extends Equatable {
  final Async<List<BranchModel>> getAllBranchesState;
  final Async<BranchDetailsModel> showBranchDetailsState;
  final String selectedFilter;
  final String searchQuery;
  final String? selectedDropdownShipmentType;
  final List<String> availableDropdownOptions;

  const ShipmentsAddressesState({
    this.getAllBranchesState = const AsyncInitial(),
    this.showBranchDetailsState = const AsyncInitial(),
    this.selectedFilter = 'air',
    this.searchQuery = '',
    this.selectedDropdownShipmentType,
    this.availableDropdownOptions = const [],
  });

  ShipmentsAddressesState copyWith({
    Async<List<BranchModel>>? getAllBranchesState,
    Async<BranchDetailsModel>? showBranchDetailsState,
    String? selectedFilter,
    String? searchQuery,
    String? selectedDropdownShipmentType,
    List<String>? availableDropdownOptions,
  }) {
    return ShipmentsAddressesState(
      getAllBranchesState: getAllBranchesState ?? this.getAllBranchesState,
      showBranchDetailsState:
          showBranchDetailsState ?? this.showBranchDetailsState,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedDropdownShipmentType:
          selectedDropdownShipmentType ?? this.selectedDropdownShipmentType,
      availableDropdownOptions:
          availableDropdownOptions ?? this.availableDropdownOptions,
    );
  }

  @override
  List<Object?> get props => [
    getAllBranchesState,
    showBranchDetailsState,
    selectedFilter,
    searchQuery,
    selectedDropdownShipmentType,
    availableDropdownOptions,
  ];
}
