import 'package:almeyar/core/network/api_error_model.dart';
import 'package:almeyar/core/network/local_status_codes.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:almeyar/core/utils/async.dart';
import 'package:almeyar/features/wallets/data/models/wallet_model.dart';
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
}
