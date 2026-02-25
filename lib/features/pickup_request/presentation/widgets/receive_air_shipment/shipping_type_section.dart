part of '../../feature_imports.dart';

class ShippingTypeSection extends StatelessWidget {
  const ShippingTypeSection({
    super.key,
    required this.isExpressSelected,
    required this.onExpressSelected,
    required this.onEconomySelected,
  });

  final bool isExpressSelected;
  final VoidCallback onExpressSelected;
  final VoidCallback onEconomySelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: LocaleKeys.receive_air_shipping_type.tr()),
        verticalSpace(AppSizes.h10),
        ShippingTypeSelector(
          isExpressSelected: isExpressSelected,
          onExpressSelected: onExpressSelected,
          onEconomySelected: onEconomySelected,
        ),
      ],
    );
  }
}
