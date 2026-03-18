part of '../../feature_imports.dart';

class RequestItemDetailsFinancialSummary extends StatelessWidget {
  const RequestItemDetailsFinancialSummary({
    super.key,
    required this.totalBoxesCost,
    required this.totalDiscounts,
    required this.amountDue,
    required this.deliveryCost,
  });

  final String totalBoxesCost;
  final String totalDiscounts;
  final String amountDue;
  final String deliveryCost;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Column(
        children: [
          RequestItemDetailsInfoRow(
            label: LocaleKeys.delivery_request_details_total_boxes_cost.tr(),
            value: totalBoxesCost,
          ),
          const Divider(height: 1, color: AppColors.grey98),
          RequestItemDetailsInfoRow(
            label: LocaleKeys.delivery_request_details_total_discounts.tr(),
            value: totalDiscounts,
            valueColor: AppColors.orange,
          ),
          const Divider(height: 1, color: AppColors.grey98),
          RequestItemDetailsInfoRow(
            label: LocaleKeys.delivery_request_details_amount_due.tr(),
            value: amountDue,
          ),
          const Divider(height: 1, color: AppColors.grey98),
          RequestItemDetailsInfoRow(
            label: LocaleKeys.delivery_request_details_delivery_cost.tr(),
            value: deliveryCost,
          ),
        ],
      ),
    );
  }
}
