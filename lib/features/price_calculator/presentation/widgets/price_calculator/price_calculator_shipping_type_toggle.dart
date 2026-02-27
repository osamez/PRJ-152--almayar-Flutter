part of '../../feature_imports.dart';

class PriceCalculatorShippingTypeToggle extends StatelessWidget {
  const PriceCalculatorShippingTypeToggle({
    super.key,
    required this.isSeaShipping,
    required this.onSeaSelected,
    required this.onAirSelected,
  });

  final bool isSeaShipping;
  final VoidCallback onSeaSelected;
  final VoidCallback onAirSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppElevatedButton(
            text: LocaleKeys.price_calculator_air_shipping.tr(),
            iconPath: AppAssets.svgAirplane,
            onPressed: onAirSelected,
            backgroundColor: !isSeaShipping
                ? AppColors.deepViolet
                : AppColors.white,
            textColor: !isSeaShipping ? AppColors.white : AppColors.deepViolet,
            borderColor: !isSeaShipping ? null : AppColors.gray,
          ),
        ),
        horizontalSpace(AppSizes.w10),
        Expanded(
          child: AppElevatedButton(
            text: LocaleKeys.price_calculator_sea_shipping.tr(),
            iconPath: AppAssets.svgBoat,
            onPressed: onSeaSelected,
            backgroundColor: isSeaShipping
                ? AppColors.deepViolet
                : AppColors.white,
            textColor: isSeaShipping ? AppColors.white : AppColors.deepViolet,
            borderColor: isSeaShipping ? null : AppColors.gray,
          ),
        ),
      ],
    );
  }
}
