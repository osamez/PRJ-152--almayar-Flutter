part of '../feature_imports.dart';

class MoneyTransfersCubit extends Cubit<MoneyTransfersState> {
  final MoneyTransfersRepo _repo;
  final InternetService _internetService;

  MoneyTransfersCubit(this._repo, this._internetService)
    : super(const MoneyTransfersState());

  int _getStatusFromIndex(int index) {
    switch (index) {
      case 0:
        return 3;
      case 1:
        return 10;
      case 2:
        return 5;
      default:
        return 3;
    }
  }

  Future<void> selectTab(int index) async {
    final selectedStatus = _getStatusFromIndex(index);
    emit(state.copyWith(selectedIndex: index, selectedStatus: selectedStatus));
    await getMoneyTransfers(status: selectedStatus);
  }

  Future<void> getMoneyTransfers({int? status, int page = 1}) async {
    if (page == 1) {
      emit(
        state.copyWith(
          moneyTransfersState: const AsyncLoading(),
          selectedStatus: status ?? state.selectedStatus,
          currentPage: 1,
          isPaginationLoading: false,
        ),
      );
    } else {
      emit(state.copyWith(isPaginationLoading: true));
    }

    if (!await _internetService.isConnected()) {
      final error = AsyncError<List<MoneyTransferModel>>(
        ApiErrorModel(
          error: LocaleKeys.no_internet_error.tr(),
          status: LocalStatusCodes.connectionError,
        ),
      );
      emit(
        state.copyWith(
          moneyTransfersState: page == 1 ? error : state.moneyTransfersState,
          isPaginationLoading: false,
        ),
      );
      return;
    }

    final result = await _repo.getMoneyTransfers(
      status: status ?? state.selectedStatus,
      page: page,
    );

    result.when(
      onSuccess: (response) {
        final newTransfers = response.data?.moneyTransfers ?? [];
        final updatedList = page == 1
            ? newTransfers
            : [...state.transfersList, ...newTransfers];

        final meta = response.data?.meta;
        final hasMore = (meta?.currentPage ?? page) < (meta?.lastPage ?? page);

        emit(
          state.copyWith(
            moneyTransfersState: AsyncData(updatedList),
            transfersList: updatedList,
            currentPage: meta?.currentPage ?? page,
            hasMore: hasMore,
            isPaginationLoading: false,
          ),
        );
      },
      onFailure: (failure) {
        emit(
          state.copyWith(
            moneyTransfersState: page == 1
                ? AsyncError(failure)
                : state.moneyTransfersState,
            isPaginationLoading: false,
          ),
        );
      },
    );
  }

  Future<void> loadMoreTransfers() async {
    if (state.moneyTransfersState.isLoading ||
        state.isPaginationLoading ||
        !state.hasMore) {
      return;
    }

    await getMoneyTransfers(
      status: state.selectedStatus,
      page: state.currentPage + 1,
    );
  }
}
