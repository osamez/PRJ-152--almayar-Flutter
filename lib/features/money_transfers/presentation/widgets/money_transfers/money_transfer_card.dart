part of '../../feature_imports.dart';

class MoneyTransferCard extends StatelessWidget {
  const MoneyTransferCard({
    super.key,
    required this.onTap,
    required this.model,
  });

  final MoneyTransferModel model;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: Container(
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
          onTap: () {
            context.pushNamed(Routes.moneyTransferDetails);
          },
          radius: AppSizes.radiusMd,
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w12,
            vertical: AppSizes.h12,
          ),
          child: Column(
            children: [
              MoneyTransferCardHeader(
                phoneNumber: model.id.toString(),
                date: model.createdAt != null
                    ? formatDateFromApi(model.createdAt!)
                    : '',
                statusLabel: _getStatusLabel(model.status?.id),
                statusColor: _getStatusColor(model.status?.id),
              ),
              verticalSpace(AppSizes.h12),
              const Divider(height: 1, color: AppColors.shadow1),
              verticalSpace(AppSizes.h12),
              MoneyTransferInfoSection(
                invoiceValue: model.invoiceValue?.amount ?? '',
                paymentCurrency: model.paymentCurrency ?? '',
                dueAmount: model.valueDuePayment?.amount ?? '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getStatusLabel(int? statusId) {
    switch (statusId) {
      case 3:
        return LocaleKeys.money_transfers_new_transfer.tr();
      case 10:
        return LocaleKeys.money_transfers_deducted.tr();
      case 5:
        return LocaleKeys.money_transfers_completed.tr();
      default:
        return '';
    }
  }

  Color _getStatusColor(int? statusId) {
    switch (statusId) {
      case 3:
        return Colors.blue;
      case 10:
        return AppColors.orange;
      case 5:
        return AppColors.green;
      default:
        return AppColors.orange;
    }
  }
}
