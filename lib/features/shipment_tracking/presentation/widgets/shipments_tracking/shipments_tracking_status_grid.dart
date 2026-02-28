part of '../../feature_imports.dart';

class ShipmentsTrackingStatusGrid extends StatelessWidget {
  const ShipmentsTrackingStatusGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_StatusItem> statusItems = [
      const _StatusItem(
        titleKey: LocaleKeys.shipment_tracking_at_pickup_point,
        count: 373,
      ),
      const _StatusItem(
        titleKey: LocaleKeys.shipment_tracking_being_prepared,
        count: 373,
      ),
      const _StatusItem(
        titleKey: LocaleKeys.shipment_tracking_prepared,
        count: 373,
      ),
      const _StatusItem(
        titleKey: LocaleKeys.shipment_tracking_being_shipped,
        count: 373,
      ),
      const _StatusItem(
        titleKey: LocaleKeys.shipment_tracking_at_delivery_point,
        count: 373,
      ),
      const _StatusItem(
        titleKey: LocaleKeys.shipment_tracking_ready_for_delivery,
        count: 373,
      ),
      const _StatusItem(
        titleKey: LocaleKeys.shipment_tracking_cancelled,
        count: 373,
      ),
    ];

    return GridView.builder(
      itemCount: statusItems.length + 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.w12,
        mainAxisSpacing: AppSizes.h12,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        if (index == statusItems.length) {
          return const ShipmentsTrackingAllShipmentsCard();
        }
        final item = statusItems[index];
        return ShipmentsTrackingStatusCard(
          title: item.titleKey.tr(),
          count: item.count,
        );
      },
    );
  }
}

class _StatusItem {
  final String titleKey;
  final int count;

  const _StatusItem({required this.titleKey, required this.count});
}
