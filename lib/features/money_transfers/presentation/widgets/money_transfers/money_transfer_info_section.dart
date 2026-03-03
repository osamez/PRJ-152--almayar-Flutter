part of '../../feature_imports.dart';

class MoneyTransferInfoSection extends StatelessWidget {
  const MoneyTransferInfoSection({
    super.key,
    required this.invoiceValue,
    required this.paymentCurrency,
    required this.dueAmount,
  });

  final String invoiceValue;
  final String paymentCurrency;
  final String dueAmount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MoneyTransferInfoItem(
            iconPath: AppAssets.svgInvoice,
            label: LocaleKeys.money_transfers_invoice_value.tr(),
            value: invoiceValue,
          ),
        ),
        _buildDivider(),
        Expanded(
          child: MoneyTransferInfoItem(
            iconPath: AppAssets.svgCoins,
            label: LocaleKeys.money_transfers_payment_currency.tr(),
            value: paymentCurrency,
          ),
        ),
        _buildDivider(),
        Expanded(
          child: MoneyTransferInfoItem(
            iconPath: AppAssets.svgMoneyWavy,
            label: LocaleKeys.money_transfers_due_amount.tr(),
            value: dueAmount,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: AppSizes.h36,
      margin: EdgeInsets.symmetric(horizontal: AppSizes.w6),
      color: AppColors.gray,
    );
  }
}
