part of '../../feature_imports.dart';

class ShipmentsAddressesCubit extends Cubit<ShipmentsAddressesState> {
  final HomeRepo _homeRepo;
  final InternetService _internetService;
  List<BranchModel> _allBranches = [];

  ShipmentsAddressesCubit(this._homeRepo, this._internetService)
    : super(const ShipmentsAddressesState());

  Future<void> getAllBranches() async {
    emit(state.copyWith(getAllBranchesState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          getAllBranchesState: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = await _homeRepo.getAllBranches();

    result.when(
      onSuccess: (response) {
        _allBranches = response.data ?? [];
        _applyFilters();
      },
      onFailure: (failure) {
        emit(state.copyWith(getAllBranchesState: AsyncError(failure)));
      },
    );
  }

  Future<void> showBranchDetails(int id) async {
    emit(state.copyWith(showBranchDetailsState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          showBranchDetailsState: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = await _homeRepo.showBranch(id);

    result.when(
      onSuccess: (response) {
        if (response.data != null) {
          emit(state.copyWith(showBranchDetailsState: AsyncData(response.data!)));
        } else {
          emit(
            state.copyWith(
              showBranchDetailsState: AsyncError(
                ApiErrorModel(
                  error: 'branch_not_found',
                  status: LocalStatusCodes.defaultError,
                ),
              ),
            ),
          );
        }
      },
      onFailure: (failure) {
        emit(state.copyWith(showBranchDetailsState: AsyncError(failure)));
      },
    );
  }

  void selectFilter(String filter) {
    emit(state.copyWith(selectedFilter: filter));
    _applyFilters();
  }

  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
    _applyFilters();
  }

  void _applyFilters() {
    final filtered = _allBranches.where((branch) {
      final matchesFilter =
          branch.availableShippingWays?.any(
            (way) =>
                way.id?.toLowerCase() == state.selectedFilter.toLowerCase(),
          ) ??
          false;
      final matchesSearch =
          branch.branchName?.toLowerCase().contains(
            state.searchQuery.toLowerCase(),
          ) ??
          true;
      return matchesFilter && matchesSearch;
    }).toList();

    emit(state.copyWith(getAllBranchesState: AsyncData(filtered)));
  }
}
