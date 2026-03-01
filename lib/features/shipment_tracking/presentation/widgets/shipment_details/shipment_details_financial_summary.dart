part of '../../feature_imports.dart';

class ShipmentDetailsFinancialSummary extends StatelessWidget {
  const ShipmentDetailsFinancialSummary({
    super.key,
    required this.boxesShippingCost,
    required this.totalDiscounts,
    required this.totalPrice,
  });

  final String boxesShippingCost;
  final String totalDiscounts;
  final String totalPrice;

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
          ShipmentDetailsInfoRow(
            label: LocaleKeys.shipment_details_boxes_shipping_cost.tr(),
            value: boxesShippingCost,
          ),
          const Divider(height: 1, color: AppColors.grey98),
          ShipmentDetailsInfoRow(
            label: LocaleKeys.shipment_details_total_discounts.tr(),
            value: totalDiscounts,
            valueColor: AppColors.orange,
          ),
          const Divider(height: 1, color: AppColors.grey98),
          ShipmentDetailsInfoRow(
            label: LocaleKeys.shipment_details_total_price.tr(),
            value: totalPrice,
          ),
        ],
      ),
    );
  }
}
