part of '../../feature_imports.dart';

class WalletMoneyTransferSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  const WalletMoneyTransferSubmitButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.wallet_money_transfer_submit.tr(),
      onPressed: onPressed,
    );
  }
}
