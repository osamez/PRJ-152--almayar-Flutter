part of '../../feature_imports.dart';

class PriceCalculatorShippingMethodSection extends StatelessWidget {
  const PriceCalculatorShippingMethodSection({
    super.key,
    required this.isSeaShipping,
    required this.isPrimarySelected,
    required this.onPrimarySelected,
    required this.onSecondarySelected,
  });

  final bool isSeaShipping;
  final bool isPrimarySelected;
  final VoidCallback onPrimarySelected;
  final VoidCallback onSecondarySelected;

  String get _primaryLabel => isSeaShipping
      ? LocaleKeys.price_calculator_sea_private.tr()
      : LocaleKeys.price_calculator_air_express.tr();

  String get _secondaryLabel => isSeaShipping
      ? LocaleKeys.price_calculator_sea_shared.tr()
      : LocaleKeys.price_calculator_air_economy.tr();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.price_calculator_shipping_method.tr(),
          style: AppTextStyleFactory.create(
            size: 13,
            weight: FontWeight.w400,
            color: AppColors.lightHeadingText,
          ),
        ),
        verticalSpace(AppSizes.h10),
        PriceCalculatorShippingMethodToggle(
          primaryLabel: _primaryLabel,
          secondaryLabel: _secondaryLabel,
          isPrimarySelected: isPrimarySelected,
          onPrimarySelected: onPrimarySelected,
          onSecondarySelected: onSecondarySelected,
        ),
      ],
    );
  }
}
