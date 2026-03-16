part of '../../feature_imports.dart';

class ShipmentDetailsFinancialDataTab extends StatelessWidget {
  final ShipmentModel shipment;
  const ShipmentDetailsFinancialDataTab({super.key, required this.shipment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ShipmentDetailsSectionTitle(
          title: LocaleKeys.shipment_details_financial_data_tab.tr(),
        ),
        verticalSpace(AppSizes.h20),
        ShipmentDetailsInfoSection(
          rows: [
            ShipmentDetailsInfoRowData(
              label:
                  '${LocaleKeys.shipment_details_volume_cost_per_cbm.tr()} (\$)',
              value: '\$${shipment.pricePerCbm}',
            ),
            ShipmentDetailsInfoRowData(
              label:
                  '${LocaleKeys.shipment_details_weight_cost_per_kg.tr()} (\$)',
              value: '\$${shipment.pricePerKg}',
            ),
            ShipmentDetailsInfoRowData(
              label:
                  '${LocaleKeys.shipment_details_additional_costs.tr()} (\$)',
              value: '\$${shipment.extraPrice}',
            ),
            ShipmentDetailsInfoRowData(
              label: '${LocaleKeys.shipment_details_discount_value.tr()} (\$)',
              value: '- \$${shipment.discountPrice}',
              valueColor: AppColors.orange,
            ),
            ShipmentDetailsInfoRowData(
              label:
                  '${LocaleKeys.shipment_details_company_discount.tr()} (\$)',
              value: '- \$${shipment.companiesDiscountValue}',
              valueColor: AppColors.orange,
            ),
            ShipmentDetailsInfoRowData(
              label: LocaleKeys.shipment_details_payment_status.tr(),
              value: shipment.financialStatus!.name ?? '--',
              valueColor: AppColors.orange,
            ),
          ],
        ),
        verticalSpace(AppSizes.h24),
        ShipmentDetailsSectionTitle(
          title: LocaleKeys.shipment_details_financial_summary.tr(),
        ),
        verticalSpace(AppSizes.h16),
        ShipmentDetailsFinancialSummary(
          boxesShippingCost: '\$${shipment.shipmentPriceBeforeDiscount}',
          totalDiscounts: '- \$${shipment.discountPrice}',
          totalPrice: '\$${shipment.totalPrice}',
        ),
      ],
    );
  }
}
