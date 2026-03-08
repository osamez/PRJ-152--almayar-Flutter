part of '../../feature_imports.dart';

class WalletMoneyTransferSummaryCard extends StatelessWidget {
  const WalletMoneyTransferSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DetailsInfoCardSection(
      rows: [
        DetailsInfoRowData(
          label: LocaleKeys.wallet_money_transfer_customer_code_label.tr(),
          value: 'TIP-2345',
          valueColor: AppColors.deepViolet,
        ),
        DetailsInfoRowData(
          label: LocaleKeys.wallet_money_transfer_beneficiary_name.tr(),
          value: 'أسامة مصطفى المرغني',
          valueColor: AppColors.deepViolet,
        ),
        DetailsInfoRowData(
          label: LocaleKeys.wallet_money_transfer_amount_to_transfer.tr(),
          value: '\$2098',
          valueColor: AppColors.deepViolet,
        ),
      ],
    );
  }
}
