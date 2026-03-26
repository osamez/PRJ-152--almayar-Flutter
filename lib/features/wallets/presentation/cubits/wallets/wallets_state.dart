part of 'wallets_cubit.dart';

class WalletsState extends Equatable {
  final Async<List<WalletModel>> getMyWalletsState;
  final Async<List<WalletTransactionModel>> getWalletTransactionsState;

  // Filters
  final TransactionTypeModel? selectedTransactionType;
  final String? fromDate;
  final String? toDate;

  const WalletsState({
    this.getMyWalletsState = const AsyncInitial(),
    this.getWalletTransactionsState = const AsyncInitial(),
    this.selectedTransactionType,
    this.fromDate,
    this.toDate,
  });

  WalletsState copyWith({
    Async<List<WalletModel>>? getMyWalletsState,
    Async<List<WalletTransactionModel>>? getWalletTransactionsState,
    TransactionTypeModel? Function()? selectedTransactionType,
    String? Function()? fromDate,
    String? Function()? toDate,
  }) {
    return WalletsState(
      getMyWalletsState: getMyWalletsState ?? this.getMyWalletsState,
      getWalletTransactionsState:
          getWalletTransactionsState ?? this.getWalletTransactionsState,
      selectedTransactionType: selectedTransactionType != null
          ? selectedTransactionType()
          : this.selectedTransactionType,
      fromDate: fromDate != null ? fromDate() : this.fromDate,
      toDate: toDate != null ? toDate() : this.toDate,
    );
  }

  @override
  List<Object?> get props => [
        getMyWalletsState,
        getWalletTransactionsState,
        selectedTransactionType,
        fromDate,
        toDate,
      ];
}
