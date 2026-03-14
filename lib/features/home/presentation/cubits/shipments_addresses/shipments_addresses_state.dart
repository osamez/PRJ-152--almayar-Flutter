part of '../../feature_imports.dart';

class ShipmentsAddressesState extends Equatable {
  final Async<List<BranchModel>> getAllBranchesState;
  final String selectedFilter;
  final String searchQuery;

  const ShipmentsAddressesState({
    this.getAllBranchesState = const AsyncInitial(),
    this.selectedFilter = 'air',
    this.searchQuery = '',
  });

  ShipmentsAddressesState copyWith({
    Async<List<BranchModel>>? getAllBranchesState,
    String? selectedFilter,
    String? searchQuery,
  }) {
    return ShipmentsAddressesState(
      getAllBranchesState: getAllBranchesState ?? this.getAllBranchesState,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [getAllBranchesState, selectedFilter, searchQuery];
}
