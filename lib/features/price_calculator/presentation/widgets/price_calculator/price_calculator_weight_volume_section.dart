part of '../../feature_imports.dart';

class PriceCalculatorWeightVolumeSection extends StatelessWidget {
  const PriceCalculatorWeightVolumeSection({
    super.key,
    required this.weightController,
    required this.volumeController,
  });

  final TextEditingController weightController;
  final TextEditingController volumeController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PriceCalculatorCubit>();

    return Row(
      children: [
        Expanded(
          child: AppTextFormField(
            controller: volumeController,
            title: LocaleKeys.price_calculator_total_volume.tr(),
            hintText: LocaleKeys.price_calculator_enter_total_volume.tr(),
            validator: (value) => value == null || value.isEmpty
                ? LocaleKeys.receive_shipment_enter_total_volume.tr()
                : null,
            keyboardType: TextInputType.number,
            titleColor: AppColors.lightHeadingText,
            onChanged: (value) => cubit.updateSize(value),
          ),
        ),
        horizontalSpace(AppSizes.w8),
        Expanded(
          child: AppTextFormField(
            controller: weightController,
            title: LocaleKeys.price_calculator_total_weight.tr(),
            hintText: LocaleKeys.price_calculator_enter_total_weight.tr(),
            validator: (value) => value == null || value.isEmpty
                ? LocaleKeys.receive_shipment_enter_total_weight.tr()
                : null,
            keyboardType: TextInputType.number,
            titleColor: AppColors.lightHeadingText,
            onChanged: (value) => cubit.updateWeight(value),
          ),
        ),
      ],
    );
  }
}
