import 'dart:async';

import 'package:almeyar/core/utils/exports.dart';
import 'package:equatable/equatable.dart';

part 'confirm_transfer_state.dart';

class ConfirmTransferCubit extends Cubit<ConfirmTransferState> {
  ConfirmTransferCubit() : super(const ConfirmTransferState());

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

  void confirmTransfer() {
    if (state.otpCode.length != 6) return;
    // TODO: call repository to confirm transfer
  }

  void resendOtp() {
    if (!state.canResend) return;
    startTimer();
    // TODO: call repository to resend OTP
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
