part of '../../feature_imports.dart';

class PriceCalculatorViewBody extends StatefulWidget {
  const PriceCalculatorViewBody({super.key});

  @override
  State<PriceCalculatorViewBody> createState() =>
      _PriceCalculatorViewBodyState();
}

class _PriceCalculatorViewBodyState extends State<PriceCalculatorViewBody> {
  bool _isSeaShipping = true;
  bool _isPrimaryMethodSelected = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PriceCalculatorShippingTypeSection(
            isSeaShipping: _isSeaShipping,
            onSeaSelected: () => setState(() {
              _isSeaShipping = true;
              _isPrimaryMethodSelected = true;
            }),
            onAirSelected: () => setState(() {
              _isSeaShipping = false;
              _isPrimaryMethodSelected = true;
            }),
          ),
          verticalSpace(AppSizes.h20),
          PriceCalculatorShippingMethodSection(
            isSeaShipping: _isSeaShipping,
            isPrimarySelected: _isPrimaryMethodSelected,
            onPrimarySelected: () =>
                setState(() => _isPrimaryMethodSelected = true),
            onSecondarySelected: () =>
                setState(() => _isPrimaryMethodSelected = false),
          ),
          verticalSpace(AppSizes.h20),
          const PriceCalculatorPickupBranchField(),
          verticalSpace(AppSizes.h16),
          const PriceCalculatorDeliveryBranchField(),
          verticalSpace(AppSizes.h16),
          const PriceCalculatorClassificationField(),
          verticalSpace(AppSizes.h20),
          const PriceCalculatorBoxesContentsSection(),
          verticalSpace(AppSizes.h24),
          const PriceCalculatorBoxesImage(),
          verticalSpace(AppSizes.h16),
          const PriceCalculatorWeightVolumeSection(),
          verticalSpace(AppSizes.h32),
          const PriceCalculatorCalculateButton(),
          verticalSpace(AppSizes.h20),
        ],
      ),
    );
  }
}
