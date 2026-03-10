part of 'otp_cubit.dart';

class OtpState extends Equatable {
  final String otpCode;
  final int remainingSeconds;
  final bool canResend;
  final Async<MessageModel> sendOtpState;

  const OtpState({
    this.otpCode = '',
    this.remainingSeconds = 0,
    this.canResend = false,
    this.sendOtpState = const AsyncInitial(),
  });

  OtpState copyWith({
    String? otpCode,
    int? remainingSeconds,
    bool? canResend,
    Async<MessageModel>? sendOtpState,
  }) {
    return OtpState(
      otpCode: otpCode ?? this.otpCode,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      canResend: canResend ?? this.canResend,
      sendOtpState: sendOtpState ?? this.sendOtpState,
    );
  }

  @override
  List<Object> get props => [
    otpCode,
    remainingSeconds,
    canResend,
    sendOtpState,
  ];
}
