part of '../../feature_imports.dart';

class ShipmentPickupRequestsViewBody extends StatefulWidget {
  const ShipmentPickupRequestsViewBody({super.key});

  @override
  State<ShipmentPickupRequestsViewBody> createState() =>
      _ShipmentPickupRequestsViewBodyState();
}

class _ShipmentPickupRequestsViewBodyState
    extends State<ShipmentPickupRequestsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(AppSizes.h16),
        const PickupSearchBar().withPadding(horizontal: AppSizes.w20),
        verticalSpace(AppSizes.h16),
        const PickupShippingTypeTabs().withPadding(horizontal: AppSizes.w20),
        verticalSpace(AppSizes.h20),
        const PickupFilterHeader(
          resultCount: 3,
        ).withPadding(horizontal: AppSizes.w20),
        verticalSpace(AppSizes.h16),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w20,
              vertical: AppSizes.h8,
            ),
            itemCount: 3,
            separatorBuilder: (_, _) => verticalSpace(AppSizes.h16),
            itemBuilder: (BuildContext context, int index) {
              return PickupCard(
                status: PickupRequestStatus.values[index],
                shipmentCode: 'RH2053',
                date: '2026-01-01',
                shippingType: LocaleKeys.pickup_requests_air_express.tr(),
                originWarehouse: 'مخزن طرابلس',
                originCountry: 'ليبيا',
                destinationWarehouse: 'مخزن جوانزو',
                destinationCountry: 'الصين',
                boxesCount: '2002',
                totalVolume: '20 CMB',
                totalWeight: '2000 KG',
              );
            },
          ),
        ),
      ],
    );
  }
}
