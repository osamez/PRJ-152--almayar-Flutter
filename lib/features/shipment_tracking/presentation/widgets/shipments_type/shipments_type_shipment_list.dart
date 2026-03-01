part of '../../feature_imports.dart';

class ShipmentsTypeShipmentList extends StatelessWidget {
  const ShipmentsTypeShipmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h8,
      ),
      itemCount: 3,
      separatorBuilder: (_, _) => verticalSpace(AppSizes.h16),
      itemBuilder: (BuildContext context, int index) {
        return PickupCard(
          status: index == 0
              ? PickupRequestStatus.pending
              : PickupRequestStatus.received,
          shipmentCode: 'AIR-888-TIP-F-4852-GU',
          date: '2026-01-01',
          shippingType: LocaleKeys.shipment_tracking_air_express.tr(),
          originWarehouse: 'مخزن طرابلس',
          originCountry: 'ليبيا',
          destinationWarehouse: 'مخزن جوانزو',
          destinationCountry: 'الصين',
          boxesCount: '2002',
          totalVolume: '20 CMB',
          totalWeight: '2000 KG',
          onTap: () {
            context.push(Routes.shipmentDetails);
          },
        );
      },
    );
  }
}
