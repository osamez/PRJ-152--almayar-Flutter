part of '../../feature_imports.dart';

class ShipmentsAddressesCubit extends Cubit<ShipmentsAddressesState> {
  final HomeRepo _homeRepo;
  final InternetService _internetService;
  Timer? _debounce;

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

    final result = await _homeRepo.getAllBranches(
      search: state.searchQuery.isEmpty ? null : state.searchQuery,
      shipmentType: state.selectedFilter.isEmpty ? null : state.selectedFilter,
    );

    result.when(
      onSuccess: (response) {
        emit(
          state.copyWith(
            getAllBranchesState: AsyncData(response.data?.branches ?? []),
          ),
        );
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
          emit(
            state.copyWith(showBranchDetailsState: AsyncData(response.data!)),
          );
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
    if (state.selectedFilter == filter) return;
    emit(state.copyWith(selectedFilter: filter));
    getAllBranches();
  }

  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      getAllBranches();
    });
  }

  void initializeDropdownForShipmentType(String shipmentType) {
    List<String> options = [];
    if (shipmentType == 'air') {
      options = [
        LocaleKeys.shipment_type_air_eco.tr(),
        LocaleKeys.shipment_type_air_fast.tr(),
      ];
    } else {
      options = [
        LocaleKeys.shipment_type_sea_fcl.tr(),
        LocaleKeys.shipment_type_sea_lcl.tr(),
      ];
    }
    emit(state.copyWith(availableDropdownOptions: options));
  }

  void selectDropdownShipmentType(String type) {
    emit(state.copyWith(selectedDropdownShipmentType: type));
  }

  String getCustomerNameStr(BranchDetailsModel? data) {
    if (data == null) return '';
    final selectedType = state.selectedDropdownShipmentType;
    String name = data.name ?? '';
    String code = data.userCode ?? '';
    String type = selectedType ?? '';

    List<String> parts = [];
    if (name.isNotEmpty) parts.add(name);
    if (code.isNotEmpty) parts.add(code);
    if (type.isNotEmpty) parts.add(type);

    return parts.join(' ');
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
