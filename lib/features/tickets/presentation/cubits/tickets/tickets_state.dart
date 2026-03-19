part of '../../feature_imports.dart';

enum TicketTabType { open, pending, closed }

class TicketsState extends Equatable {
  final TicketTabType selectedTab;

  // Main fetch operation
  final Async<TicketsResponseDataModel> getAllTicketsState;

  // UI-ready list
  final List<TicketModel> tickets;

  // Pagination
  final int currentPage;
  final bool hasMore;
  final bool isPaginationLoading;

  // Side-effect state for pagination errors (snackbar)
  final Async<bool> loadMoreTicketsState;

  const TicketsState({
    this.selectedTab = TicketTabType.open,
    this.getAllTicketsState = const AsyncInitial(),
    this.tickets = const <TicketModel>[],
    this.currentPage = 1,
    this.hasMore = true,
    this.isPaginationLoading = false,
    this.loadMoreTicketsState = const AsyncInitial(),
  });

  TicketsState copyWith({
    TicketTabType? selectedTab,
    Async<TicketsResponseDataModel>? getAllTicketsState,
    List<TicketModel>? tickets,
    int? currentPage,
    bool? hasMore,
    bool? isPaginationLoading,
    Async<bool>? loadMoreTicketsState,
  }) {
    return TicketsState(
      selectedTab: selectedTab ?? this.selectedTab,
      getAllTicketsState: getAllTicketsState ?? this.getAllTicketsState,
      tickets: tickets ?? this.tickets,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
      loadMoreTicketsState: loadMoreTicketsState ?? this.loadMoreTicketsState,
    );
  }

  @override
  List<Object> get props => [
    selectedTab,
    getAllTicketsState,
    tickets,
    currentPage,
    hasMore,
    isPaginationLoading,
    loadMoreTicketsState,
  ];
}
