part of '../../feature_imports.dart';

class TicketsCubit extends Cubit<TicketsState> {
  final TicketsRepo _repo;
  final InternetService _internetService;

  TicketsCubit(this._repo, this._internetService) : super(const TicketsState());

  Future<void> getAllTickets({
    TicketTabType? tab,
    int page = 1,
    bool isPagination = false,
  }) async {
    final targetTab = tab ?? state.selectedTab;
    final statusId = _mapTabToStatusId(targetTab);

    final isNewRequest = page <= 1 && !isPagination;

    if (isPagination) {
      if (state.isPaginationLoading || !state.hasMore) return;
      emit(
        state.copyWith(
          isPaginationLoading: true,
          loadMoreTicketsState: const AsyncLoading(),
        ),
      );
    } else {
      emit(
        state.copyWith(
          selectedTab: targetTab,
          getAllTicketsState: const AsyncLoading(),
          tickets: isNewRequest ? const [] : state.tickets,
          currentPage: 1,
          hasMore: true,
          isPaginationLoading: false,
          loadMoreTicketsState: const AsyncInitial(),
        ),
      );
    }

    if (!await _internetService.isConnected()) {
      final failure = ApiErrorModel(
        error: 'no_internet',
        status: LocalStatusCodes.connectionError,
      );

      if (isPagination) {
        emit(
          state.copyWith(
            isPaginationLoading: false,
            loadMoreTicketsState: AsyncError(failure),
          ),
        );
      } else {
        emit(state.copyWith(getAllTicketsState: AsyncError(failure)));
      }
      return;
    }

    final result = await _repo.getAllTickets(status: statusId, page: page);

    result.when(
      onSuccess: (response) {
        final responseData = response.data;
        final newItems = responseData?.tickets ?? const <TicketModel>[];
        final meta = responseData?.meta;

        final merged = isPagination
            ? [...state.tickets, ...newItems]
            : (page <= 1 ? newItems : [...state.tickets, ...newItems]);

        final currentPage = meta?.currentPage ?? page;
        final lastPage = meta?.lastPage ?? currentPage;

        emit(
          state.copyWith(
            getAllTicketsState: AsyncData(
              responseData ?? const TicketsResponseDataModel(),
            ),
            tickets: merged,
            currentPage: currentPage,
            hasMore: currentPage < lastPage,
            isPaginationLoading: false,
            loadMoreTicketsState: isPagination
                ? const AsyncData(true)
                : const AsyncInitial(),
          ),
        );
      },
      onFailure: (failure) {
        if (isPagination) {
          emit(
            state.copyWith(
              isPaginationLoading: false,
              loadMoreTicketsState: AsyncError(failure),
            ),
          );
          return;
        }

        emit(state.copyWith(getAllTicketsState: AsyncError(failure)));
      },
    );
  }

  Future<void> loadMoreTickets() async {
    if (state.isPaginationLoading || !state.hasMore) return;
    await getAllTickets(
      tab: state.selectedTab,
      page: state.currentPage + 1,
      isPagination: true,
    );
  }

  void changeTab(TicketTabType tab) {
    if (tab == state.selectedTab) return;
    getAllTickets(tab: tab);
  }

  int _mapTabToStatusId(TicketTabType tab) {
    switch (tab) {
      case TicketTabType.open:
        return 3;
      case TicketTabType.pending:
        return 4;
      case TicketTabType.closed:
        return 5;
    }
  }

  @override
  void emit(TicketsState state) {
    if (isClosed) return;
    super.emit(state);
  }
}
