import 'dart:async';

import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/features/wallets/data/models/transfer_request_model.dart';
import 'package:almeyar/features/wallets/data/repos/wallets_repo.dart';

part 'wallet_money_transfer_state.dart';

class WalletMoneyTransferCubit extends Cubit<WalletMoneyTransferState> {
  final WalletsRepo _walletsRepo;
  final InternetService _internetService;

  WalletMoneyTransferCubit(this._walletsRepo, this._internetService)
    : super(const WalletMoneyTransferState());

  void init(String walletId) {
    emit(state.copyWith(fromWalletId: walletId));
  }

  Timer? _timer;
  final int _totalSeconds = 7 * 60;

  void startTimer() {
    _timer?.cancel();
    emit(state.copyWith(remainingSeconds: _totalSeconds, canResend: false));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final newSeconds = state.remainingSeconds - 1;
      if (newSeconds <= 0) {
        timer.cancel();
        emit(state.copyWith(remainingSeconds: 0, canResend: true));
      } else {
        emit(state.copyWith(remainingSeconds: newSeconds));
      }
    });
  }

  void onOtpChanged(String otp) {
    emit(state.copyWith(otpCode: otp));
  }

  Future<void> sendOtp({
    required String customerCode,
    required String amount,
  }) async {
    emit(
      state.copyWith(
        sendOtpState: const AsyncLoading(),
        customerCode: customerCode,
        amount: amount,
      ),
    );

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          sendOtpState: AsyncError(ApiErrorModel(error: 'no_internet')),
        ),
      );
      return;
    }

    final result = await _walletsRepo.sendOtp();

    result.when(
      onSuccess: (response) {
        emit(state.copyWith(sendOtpState: AsyncData(response.data!)));
        startTimer();
      },
      onFailure: (error) =>
          emit(state.copyWith(sendOtpState: AsyncError(error))),
    );
  }

  Future<void> transfer() async {
    emit(state.copyWith(transferState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          transferState: AsyncError(ApiErrorModel(error: 'no_internet')),
        ),
      );
      return;
    }

    final request = TransferRequestModel(
      targetUserCode: state.customerCode,
      amount: state.amount,
      otp: state.otpCode,
      fromWalletId: state.fromWalletId,
    );

    final result = await _walletsRepo.transfer(request);

    result.when(
      onSuccess: (response) =>
          emit(state.copyWith(transferState: AsyncData(response.data!))),
      onFailure: (error) =>
          emit(state.copyWith(transferState: AsyncError(error))),
    );
  }

  void resetStates() {
    emit(
      state.copyWith(
        sendOtpState: const AsyncInitial(),
        transferState: const AsyncInitial(),
      ),
    );
  }

  String get formattedTime {
    final minutes = (state.remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (state.remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
