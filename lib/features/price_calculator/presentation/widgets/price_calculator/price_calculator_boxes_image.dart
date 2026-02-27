part of '../../feature_imports.dart';

class PriceCalculatorBoxesImage extends StatelessWidget {
  const PriceCalculatorBoxesImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppAssets.imagesBoxes,
        height: AppSizes.h150,
        fit: BoxFit.contain,
      ),
    );
  }
}
