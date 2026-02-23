part of 'otp_cubit.dart';

class OtpState extends Equatable {
  final String otpCode;
  final int remainingSeconds;
  final bool canResend;

  const OtpState({
    this.otpCode = '',
    this.remainingSeconds = 0,
    this.canResend = false,
  });

  OtpState copyWith({String? otpCode, int? remainingSeconds, bool? canResend}) {
    return OtpState(
      otpCode: otpCode ?? this.otpCode,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      canResend: canResend ?? this.canResend,
    );
  }

  @override
  List<Object> get props => [otpCode, remainingSeconds, canResend];
}
