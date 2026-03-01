part of '../../feature_imports.dart';

class ShipmentDetailsBoxesDataTab extends StatelessWidget {
  const ShipmentDetailsBoxesDataTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ShipmentDetailsSectionTitle(
          title: LocaleKeys.shipment_details_boxes_data_tab.tr(),
        ),
        verticalSpace(AppSizes.h20),
        const ShipmentDetailsBoxCard(
          statusLabel: 'قيد التوصيل',
          date: '2026-01-01',
          shippingType: 'بحري مشترك',
          totalVolume: 'CMB 20',
          totalWeight: 'KG 2000',
          boxCode: 'AIR-3486-TIP-F-3311-GU-PK1/1',
          dimensions: '20سم ,30.8سم ,40.5سم',
          shipmentCode: 'AIR-3486-TIP-F-3311-GU-PK1/1',
          tripCode: 'GU-TIP-AIR-F-56',
          boxPrice: '\$200',
          discount: '\$50-',
          dueAmount: '\$150',
        ),
        verticalSpace(AppSizes.h16),
        const ShipmentDetailsBoxCard(
          statusLabel: 'قيد التوصيل',
          date: '2026-01-01',
          shippingType: 'بحري مشترك',
          totalVolume: 'CMB 20',
          totalWeight: 'KG 2000',
          boxCode: 'AIR-3486-TIP-F-3311-GU-PK1/1',
          dimensions: '20سم ,30.8سم ,40.5سم',
          shipmentCode: 'AIR-3486-TIP-F-3311-GU-PK1/1',
          tripCode: 'GU-TIP-AIR-F-56',
          boxPrice: '\$200',
          discount: '\$50-',
          dueAmount: '\$150',
        ),
      ],
    );
  }
}
