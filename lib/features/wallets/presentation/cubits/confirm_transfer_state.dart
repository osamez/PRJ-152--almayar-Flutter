part of 'confirm_transfer_cubit.dart';

class ConfirmTransferState extends Equatable {
  final String otpCode;
  final int remainingSeconds;
  final bool canResend;

  const ConfirmTransferState({
    this.otpCode = '',
    this.remainingSeconds = 0,
    this.canResend = false,
  });

  ConfirmTransferState copyWith({
    String? otpCode,
    int? remainingSeconds,
    bool? canResend,
  }) {
    return ConfirmTransferState(
      otpCode: otpCode ?? this.otpCode,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      canResend: canResend ?? this.canResend,
    );
  }

  @override
  List<Object> get props => [otpCode, remainingSeconds, canResend];
}
