part of '../../feature_imports.dart';

class PriceCalculatorPickupBranchField extends StatelessWidget {
  const PriceCalculatorPickupBranchField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      title: LocaleKeys.price_calculator_pickup_branch.tr(),
      hintText: LocaleKeys.price_calculator_select_branch.tr(),
      validator: (value) => null,
      readOnly: true,
      suffixIcon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 25,
        color: AppColors.deepViolet,
      ),
    );
  }
}
