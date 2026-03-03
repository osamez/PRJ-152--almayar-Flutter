part of '../../feature_imports.dart';

class MoneyTransferCard extends StatelessWidget {
  const MoneyTransferCard({
    super.key,
    required this.phoneNumber,
    required this.date,
    required this.statusLabel,
    required this.statusColor,
    required this.invoiceValue,
    required this.paymentCurrency,
    required this.dueAmount,
    required this.onTap,
  });

  final String phoneNumber;
  final String date;
  final String statusLabel;
  final Color statusColor;
  final String invoiceValue;
  final String paymentCurrency;
  final String dueAmount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CustomInkWellWidget(
        onTap: onTap,
        radius: AppSizes.radiusMd,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w12,
          vertical: AppSizes.h12,
        ),
        child: Column(
          children: [
            MoneyTransferCardHeader(
              phoneNumber: phoneNumber,
              date: date,
              statusLabel: statusLabel,
              statusColor: statusColor,
            ),
            verticalSpace(AppSizes.h12),
            const Divider(height: 1, color: AppColors.shadow1),
            verticalSpace(AppSizes.h12),
            MoneyTransferInfoSection(
              invoiceValue: invoiceValue,
              paymentCurrency: paymentCurrency,
              dueAmount: dueAmount,
            ),
          ],
        ),
      ),
    );
  }
}
