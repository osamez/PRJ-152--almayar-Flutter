part of '../../feature_imports.dart';

class ShippingTypeSection extends StatelessWidget {
  const ShippingTypeSection({
    super.key,
    required this.shipmentType,
    required this.isPrimarySelected,
    required this.onPrimarySelected,
    required this.onSecondarySelected,
  });

  final ShipmentType shipmentType;
  final bool isPrimarySelected;
  final VoidCallback onPrimarySelected;
  final VoidCallback onSecondarySelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: LocaleKeys.receive_shipment_shipping_type.tr()),
        verticalSpace(AppSizes.h10),
        ShippingTypeSelector(
          shipmentType: shipmentType,
          isPrimarySelected: isPrimarySelected,
          onPrimarySelected: onPrimarySelected,
          onSecondarySelected: onSecondarySelected,
        ),
      ],
    );
  }
}
