part of 'otp_cubit.dart';

class OtpState extends Equatable {
  final String otpCode;
  final int remainingSeconds;
  final bool canResend;
  final Async<MessageModel> sendOtpState;
  final Async<MessageModel> verifyOtpState;
  final String whatsappNumber;
  final String whatsappKey;

  const OtpState({
    this.otpCode = '',
    this.remainingSeconds = 0,
    this.canResend = false,
    this.sendOtpState = const AsyncInitial(),
    this.verifyOtpState = const AsyncInitial(),
    this.whatsappNumber = '',
    this.whatsappKey = '',
  });

  OtpState copyWith({
    String? otpCode,
    int? remainingSeconds,
    bool? canResend,
    Async<MessageModel>? sendOtpState,
    Async<MessageModel>? verifyOtpState,
    String? whatsappNumber,
    String? whatsappKey,
  }) {
    return OtpState(
      otpCode: otpCode ?? this.otpCode,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      canResend: canResend ?? this.canResend,
      sendOtpState: sendOtpState ?? this.sendOtpState,
      verifyOtpState: verifyOtpState ?? this.verifyOtpState,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      whatsappKey: whatsappKey ?? this.whatsappKey,
    );
  }

  @override
  List<Object> get props => [
    otpCode,
    remainingSeconds,
    remainingSeconds,
    canResend,
    sendOtpState,
    verifyOtpState,
    whatsappNumber,
    whatsappKey,
  ];
}
