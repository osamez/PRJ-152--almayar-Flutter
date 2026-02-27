part of '../../feature_imports.dart';

class PriceCalculatorShippingTypeSection extends StatelessWidget {
  const PriceCalculatorShippingTypeSection({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.price_calculator_shipping_type.tr(),
          style: AppTextStyleFactory.create(
            size: 13,
            weight: FontWeight.w400,
            color: AppColors.lightHeadingText,
          ),
        ),
        verticalSpace(AppSizes.h10),
        PriceCalculatorShippingTypeToggle(
          isSeaShipping: isSeaShipping,
          onSeaSelected: onSeaSelected,
          onAirSelected: onAirSelected,
        ),
      ],
    );
  }
}
