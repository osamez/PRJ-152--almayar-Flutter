part of '../../feature_imports.dart';

class ShipmentDetailsBoxPricingRow extends StatelessWidget {
  const ShipmentDetailsBoxPricingRow({
    super.key,
    required this.boxPrice,
    required this.discount,
    required this.dueAmount,
  });

  final String boxPrice;
  final String discount;
  final String dueAmount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ShipmentDetailsBoxPricingItem(
            label: LocaleKeys.shipment_details_box_price.tr(),
            value: boxPrice,
            valueColor: AppColors.darkText,
            icon: AppAssets.svgInvoice,
          ),
        ),
        Container(width: 1, height: AppSizes.h8, color: AppColors.orange),
        Expanded(
          child: ShipmentDetailsBoxPricingItem(
            label: LocaleKeys.shipment_details_discount_label.tr(),
            value: discount,
            valueColor: AppColors.orange,
            icon: AppAssets.svgSealPercent,
          ),
        ),
        Container(width: 1, height: AppSizes.h8, color: AppColors.orange),
        Expanded(
          child: ShipmentDetailsBoxPricingItem(
            label: LocaleKeys.shipment_details_due_amount.tr(),
            value: dueAmount,
            valueColor: AppColors.darkText,
            icon: AppAssets.svgMoneyWavy,
          ),
        ),
      ],
    );
  }
}
