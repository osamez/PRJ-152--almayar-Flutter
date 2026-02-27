part of '../../feature_imports.dart';

class PriceCalculatorBoxesContentsSection extends StatelessWidget {
  const PriceCalculatorBoxesContentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextFormField(
            title: LocaleKeys.price_calculator_boxes_count.tr(),
            hintText: LocaleKeys.price_calculator_enter_boxes_count.tr(),
            validator: (value) => null,
            keyboardType: TextInputType.number,
          ),
        ),
        horizontalSpace(AppSizes.w8),

        Expanded(
          child: AppTextFormField(
            title: LocaleKeys.price_calculator_contents.tr(),
            hintText: LocaleKeys.price_calculator_select_from_list.tr(),
            validator: (value) => null,
            readOnly: true,
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 25,
              color: AppColors.deepViolet,
            ),
          ),
        ),
      ],
    );
  }
}
