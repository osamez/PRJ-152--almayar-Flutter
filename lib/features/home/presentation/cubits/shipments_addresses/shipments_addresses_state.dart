part of '../../feature_imports.dart';

class ShipmentsAddressesState extends Equatable {
  final Async<List<BranchModel>> getAllBranchesState;
  final Async<BranchDetailsModel> showBranchDetailsState;
  final String selectedFilter;
  final String searchQuery;

  const ShipmentsAddressesState({
    this.getAllBranchesState = const AsyncInitial(),
    this.showBranchDetailsState = const AsyncInitial(),
    this.selectedFilter = 'air',
    this.searchQuery = '',
  });

  ShipmentsAddressesState copyWith({
    Async<List<BranchModel>>? getAllBranchesState,
    Async<BranchDetailsModel>? showBranchDetailsState,
    String? selectedFilter,
    String? searchQuery,
  }) {
    return ShipmentsAddressesState(
      getAllBranchesState: getAllBranchesState ?? this.getAllBranchesState,
      showBranchDetailsState:
          showBranchDetailsState ?? this.showBranchDetailsState,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [
    getAllBranchesState,
    showBranchDetailsState,
    selectedFilter,
    searchQuery,
  ];
}
