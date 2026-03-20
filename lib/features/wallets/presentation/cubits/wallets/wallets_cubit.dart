import 'package:almeyar/core/network/api_error_model.dart';
import 'package:almeyar/core/network/local_status_codes.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:almeyar/core/utils/async.dart';
import 'package:almeyar/features/wallets/data/models/transaction_type_model.dart';
import 'package:almeyar/features/wallets/data/models/wallet_model.dart';
import 'package:almeyar/features/wallets/data/models/wallet_transaction_model.dart';
import 'package:almeyar/features/wallets/data/repos/wallets_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wallets_state.dart';

class WalletsCubit extends Cubit<WalletsState> {
  final WalletsRepo _walletsRepo;
  final InternetService _internetService;

  WalletsCubit(
    this._walletsRepo,
    this._internetService,
  ) : super(const WalletsState());

  Future<void> getMyWallets() async {
    emit(state.copyWith(getMyWalletsState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          getMyWalletsState: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = await _walletsRepo.getMyWallets();

    result.when(
      onSuccess: (data) => emit(
        state.copyWith(
          getMyWalletsState: AsyncData(data.data ?? []),
        ),
      ),
      onFailure: (error) => emit(
        state.copyWith(
          getMyWalletsState: AsyncError(error),
        ),
      ),
    );
  }

  Future<void> getWalletTransactions(int walletId) async {
    emit(state.copyWith(getWalletTransactionsState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          getWalletTransactionsState: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = await _walletsRepo.getWalletTransactions(
      id: walletId,
      type: state.selectedTransactionType?.id,
      from: state.fromDate,
      to: state.toDate,
    );

    result.when(
      onSuccess: (data) => emit(
        state.copyWith(
          getWalletTransactionsState: AsyncData(data.data ?? []),
        ),
      ),
      onFailure: (error) => emit(
        state.copyWith(
          getWalletTransactionsState: AsyncError(error),
        ),
      ),
    );
  }

  void updateTransactionType(TransactionTypeModel? type) {
    emit(state.copyWith(selectedTransactionType: () => type));
  }

  void updateFromDate(String? fromDate) {
    emit(state.copyWith(fromDate: () => fromDate));
  }

  void updateToDate(String? toDate) {
    emit(state.copyWith(toDate: () => toDate));
  }

  void clearFilters() {
    emit(state.copyWith(
      selectedTransactionType: () => null,
      fromDate: () => null,
      toDate: () => null,
    ));
  }
}
