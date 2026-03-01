part of '../../feature_imports.dart';

class ShipmentDetailsFinancialDataTab extends StatelessWidget {
  const ShipmentDetailsFinancialDataTab({super.key});

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
              value: '\$800',
            ),
            ShipmentDetailsInfoRowData(
              label:
                  '${LocaleKeys.shipment_details_weight_cost_per_kg.tr()} (\$)',
              value: '\$0',
            ),
            ShipmentDetailsInfoRowData(
              label:
                  '${LocaleKeys.shipment_details_additional_costs.tr()} (\$)',
              value: '\$0',
            ),
            ShipmentDetailsInfoRowData(
              label: '${LocaleKeys.shipment_details_discount_value.tr()} (\$)',
              value: '\$200-',
              valueColor: AppColors.orange,
            ),
            ShipmentDetailsInfoRowData(
              label:
                  '${LocaleKeys.shipment_details_company_discount.tr()} (\$)',
              value: '\$200-',
              valueColor: AppColors.orange,
            ),
            ShipmentDetailsInfoRowData(
              label: LocaleKeys.shipment_details_payment_status.tr(),
              value: LocaleKeys.shipment_details_unpaid.tr(),
              valueColor: AppColors.orange,
            ),
          ],
        ),
        verticalSpace(AppSizes.h24),
        ShipmentDetailsSectionTitle(
          title: LocaleKeys.shipment_details_financial_summary.tr(),
        ),
        verticalSpace(AppSizes.h16),
        const ShipmentDetailsFinancialSummary(
          boxesShippingCost: '\$800',
          totalDiscounts: '\$400-',
          totalPrice: '\$400',
        ),
      ],
    );
  }
}
