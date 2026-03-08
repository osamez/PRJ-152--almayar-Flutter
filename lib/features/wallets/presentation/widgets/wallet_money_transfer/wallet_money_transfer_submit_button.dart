part of '../../feature_imports.dart';

class WalletMoneyTransferSubmitButton extends StatelessWidget {
  const WalletMoneyTransferSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.wallet_money_transfer_submit.tr(),
      onPressed: () {
        ConfirmTransferBottomSheet.show(context);
      },
    );
  }
}
