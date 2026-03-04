part of '../../feature_imports.dart';

class AccountStatementActionButtonsRow extends StatelessWidget {
  const AccountStatementActionButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AccountStatementActionButton(
            iconPath: AppAssets.svgHandDeposit,
            label: LocaleKeys.account_statement_transfer_funds.tr(),
            onTap: () {},
          ),
        ),
        horizontalSpace(AppSizes.w12),
        Expanded(
          child: AccountStatementActionButton(
            iconPath: AppAssets.svgHandDeposit,
            label: LocaleKeys.account_statement_charge_wallet.tr(),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
