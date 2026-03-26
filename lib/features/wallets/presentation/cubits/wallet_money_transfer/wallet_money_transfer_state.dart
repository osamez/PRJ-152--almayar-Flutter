part of 'wallet_money_transfer_cubit.dart';

class WalletMoneyTransferState extends Equatable {
  final Async<MessageModel> sendOtpState;
  final Async<MessageModel> transferState;
  final String fromWalletId;
  final String customerCode;
  final String amount;
  final String otpCode;
  final int remainingSeconds;
  final bool canResend;

  const WalletMoneyTransferState({
    this.sendOtpState = const AsyncInitial(),
    this.transferState = const AsyncInitial(),
    this.fromWalletId = '',
    this.customerCode = '',
    this.amount = '',
    this.otpCode = '',
    this.remainingSeconds = 0,
    this.canResend = false,
  });

  WalletMoneyTransferState copyWith({
    Async<MessageModel>? sendOtpState,
    Async<MessageModel>? transferState,
    String? fromWalletId,
    String? customerCode,
    String? amount,
    String? otpCode,
    int? remainingSeconds,
    bool? canResend,
  }) {
    return WalletMoneyTransferState(
      sendOtpState: sendOtpState ?? this.sendOtpState,
      transferState: transferState ?? this.transferState,
      fromWalletId: fromWalletId ?? this.fromWalletId,
      customerCode: customerCode ?? this.customerCode,
      amount: amount ?? this.amount,
      otpCode: otpCode ?? this.otpCode,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      canResend: canResend ?? this.canResend,
    );
  }

  @override
  List<Object?> get props => [
    sendOtpState,
    transferState,
    fromWalletId,
    customerCode,
    amount,
    otpCode,
    remainingSeconds,
    canResend,
  ];
}
