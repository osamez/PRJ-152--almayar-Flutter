part of '../../feature_imports.dart';

class AccountStatementActionButtonsRow extends StatelessWidget {
  const AccountStatementActionButtonsRow({super.key, required this.wallet});
  final WalletModel wallet;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AccountStatementActionButton(
            iconPath: AppAssets.svgHandDeposit,
            label: LocaleKeys.account_statement_transfer_funds.tr(),
            onTap: () async {
              final result = await context.pushNamed(
                Routes.walletMoneyTransfer,
                extra: wallet,
              );
              if (result == true && context.mounted) {
                context.read<WalletsCubit>().getWalletTransactions(wallet.id!);
              }
            },
          ),
        ),
        horizontalSpace(AppSizes.w12),
        Expanded(
          child: AccountStatementActionButton(
            iconPath: AppAssets.svgHandDeposit,
            label: LocaleKeys.account_statement_charge_wallet.tr(),
            onTap: () {
              context.pushNamed(Routes.depositRequests);
            },
          ),
        ),
      ],
    );
  }
}
