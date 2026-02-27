part of '../../feature_imports.dart';

class PriceCalculatorCalculateButton extends StatelessWidget {
  const PriceCalculatorCalculateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.price_calculator_calculate_button.tr(),
      onPressed: () {
        PriceCalculatorResultBottomSheet.show(
          context,
          costPerKg: '\$10',
          totalCost: '\$1870',
        );
      },
    );
  }
}
