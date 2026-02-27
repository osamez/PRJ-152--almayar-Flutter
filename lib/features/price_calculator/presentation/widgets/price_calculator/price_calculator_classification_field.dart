part of '../../feature_imports.dart';

class PriceCalculatorClassificationField extends StatelessWidget {
  const PriceCalculatorClassificationField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      title: LocaleKeys.price_calculator_classification.tr(),
      hintText: LocaleKeys.price_calculator_select_classification.tr(),
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
