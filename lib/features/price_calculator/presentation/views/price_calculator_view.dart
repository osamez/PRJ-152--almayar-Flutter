part of '../feature_imports.dart';

class PriceCalculatorView extends StatelessWidget {
  const PriceCalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.price_calculator_title.tr()),
      body: const PriceCalculatorViewBody(),
    );
  }
}
