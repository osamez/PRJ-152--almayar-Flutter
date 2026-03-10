import 'dart:async';

import 'package:almeyar/core/utils/async.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:equatable/equatable.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/features/auth/data/models/send_otp_request.dart';
import 'package:almeyar/features/auth/data/repositories/auth_repo.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final AuthRepo _authRepo;

  OtpCubit(this._authRepo) : super(const OtpState());

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

  void verifyOtp() {
    if (state.otpCode.length != 6) return;
    // TODO: call repository to verify OTP
  }

  void resendOtp() {
    if (!state.canResend) return;
    startTimer();
    // TODO: call repository to resend OTP
  }

  Future<void> sendOtp(SendOtpRequest request) async {
    emit(state.copyWith(sendOtpState: const AsyncLoading()));

    final result = await _authRepo.sendOtp(request);

    result.when(
      onSuccess: (data) => emit(state.copyWith(sendOtpState: AsyncData(data))),
      onFailure: (error) =>
          emit(state.copyWith(sendOtpState: AsyncError(error.error))),
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
