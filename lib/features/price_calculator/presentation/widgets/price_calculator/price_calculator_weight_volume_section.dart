part of '../../feature_imports.dart';

class PriceCalculatorWeightVolumeSection extends StatelessWidget {
  const PriceCalculatorWeightVolumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextFormField(
            title: LocaleKeys.price_calculator_total_volume.tr(),
            hintText: LocaleKeys.price_calculator_enter_total_volume.tr(),
            validator: (value) => null,
            keyboardType: TextInputType.number,
            titleColor: AppColors.lightHeadingText,
          ),
        ),
        horizontalSpace(AppSizes.w8),

        Expanded(
          child: AppTextFormField(
            title: LocaleKeys.price_calculator_total_weight.tr(),
            hintText: LocaleKeys.price_calculator_enter_total_weight.tr(),
            validator: (value) => null,
            keyboardType: TextInputType.number,
            titleColor: AppColors.lightHeadingText,
          ),
        ),
      ],
    );
  }
}
