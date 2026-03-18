part of '../../feature_imports.dart';

class MoneyTransfersState extends Equatable {
  final Async<List<MoneyTransferModel>> moneyTransfersState;
  final List<MoneyTransferModel> transfersList;
  final int currentPage;
  final bool hasMore;
  final bool isPaginationLoading;
  final int? selectedStatus;
  final int selectedIndex;

  const MoneyTransfersState({
    this.moneyTransfersState = const AsyncInitial(),
    this.transfersList = const [],
    this.currentPage = 1,
    this.hasMore = false,
    this.isPaginationLoading = false,
    this.selectedStatus = 3,
    this.selectedIndex = 0,
  });

  MoneyTransfersState copyWith({
    Async<List<MoneyTransferModel>>? moneyTransfersState,
    List<MoneyTransferModel>? transfersList,
    int? currentPage,
    bool? hasMore,
    bool? isPaginationLoading,
    int? selectedStatus,
    int? selectedIndex,
  }) {
    return MoneyTransfersState(
      moneyTransfersState: moneyTransfersState ?? this.moneyTransfersState,
      transfersList: transfersList ?? this.transfersList,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
      selectedStatus: selectedStatus ?? this.selectedStatus,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [
    moneyTransfersState,
    transfersList,
    currentPage,
    hasMore,
    isPaginationLoading,
    selectedStatus,
    selectedIndex,
  ];
}
