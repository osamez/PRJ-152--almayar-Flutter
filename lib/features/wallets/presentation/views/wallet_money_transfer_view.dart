part of '../feature_imports.dart';

class WalletMoneyTransferView extends StatelessWidget {
  const WalletMoneyTransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.wallet_money_transfer_title.tr()),
      body: const WalletMoneyTransferViewBody().withPadding(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h24,
      ),
    );
  }
}
