part of '../../feature_imports.dart';

class PriceCalculatorResultBottomSheet extends StatelessWidget {
  const PriceCalculatorResultBottomSheet({
    super.key,
    required this.costPerKg,
    required this.totalCost,
    required this.shipmentType,
    required this.flightType,
  });

  final String costPerKg;
  final String totalCost;
  final String shipmentType;
  final String flightType;

  static void show(
    BuildContext context, {
    required String costPerKg,
    required String totalCost,
    required String shipmentType,
    required String flightType,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusLg),
        ),
      ),
      builder: (_) => PriceCalculatorResultBottomSheet(
        costPerKg: costPerKg,
        totalCost: totalCost,
        flightType: flightType,
        shipmentType: shipmentType,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w20,
          vertical: AppSizes.h24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: AppSizes.w82,
                height: AppSizes.h8,
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.circular(AppSizes.radiusXxxl),
                ),
              ),
            ),
            verticalSpace(AppSizes.h32),
            Text(
              LocaleKeys.price_calculator_result_title.tr(),
              style: AppTextStyleFactory.create(
                size: 24,
                weight: FontWeight.w700,
                color: AppColors.deepViolet,
              ),
            ),
            verticalSpace(AppSizes.h50),
            PriceCalculatorCostCard(
              title: LocaleKeys.price_calculator_shipping_type.tr(),
              value: shipmentType == 'air'
                  ? flightType == 'fast'
                        ? LocaleKeys.price_calculator_air_express.tr()
                        : LocaleKeys.price_calculator_air_economy.tr()
                  : flightType == 'fast'
                  ? LocaleKeys.price_calculator_sea_private.tr()
                  : LocaleKeys.price_calculator_sea_shared.tr(),
              iconPath: shipmentType == 'air'
                  ? AppAssets.svgAirplane
                  : AppAssets.svgBoat,
            ),
            verticalSpace(AppSizes.h12),
            PriceCalculatorCostCard(
              title: shipmentType == 'air'
                  ? LocaleKeys.price_calculator_cost_per_kg.tr()
                  : LocaleKeys.price_calculator_cost_per_cbm.tr(),
              value: '\$ $costPerKg',
              iconPath: AppAssets.svgMoneyWavy,
            ),
            verticalSpace(AppSizes.h12),
            PriceCalculatorCostCard(
              title: LocaleKeys.price_calculator_total_initial_cost.tr(),
              value: '\$ $totalCost',
              iconPath: AppAssets.svgInvoice,
            ),
            verticalSpace(AppSizes.h24),
            AppElevatedButton(
              text: LocaleKeys.price_calculator_go_back.tr(),
              backgroundColor: AppColors.deepViolet,
              onPressed: () => Navigator.of(context).pop(),
            ),
            verticalSpace(AppSizes.h12),
          ],
        ),
      ),
    );
  }
}
