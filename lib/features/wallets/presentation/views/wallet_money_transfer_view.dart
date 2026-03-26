part of '../feature_imports.dart';

class WalletMoneyTransferView extends StatelessWidget {
  final WalletModel wallet;
  const WalletMoneyTransferView({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<WalletMoneyTransferCubit>()..init(wallet.id.toString()),
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: CustomAppBar(
          title: LocaleKeys.wallet_money_transfer_title.tr(),
        ),
        body: WalletMoneyTransferViewBody(
          wallet: wallet,
        ).withPadding(horizontal: AppSizes.w20, vertical: AppSizes.h24),
      ),
    );
  }
}
