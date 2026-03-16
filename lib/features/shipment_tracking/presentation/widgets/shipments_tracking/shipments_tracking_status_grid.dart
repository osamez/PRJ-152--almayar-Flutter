part of '../../feature_imports.dart';

class ShipmentsTrackingStatusGrid extends StatelessWidget {
  const ShipmentsTrackingStatusGrid({super.key, this.statusCounts});

  final List<ShipmentStatusCountModel>? statusCounts;

  @override
  Widget build(BuildContext context) {
    // If no data, use the default mock list for structure during development/loading
    final displayCounts =
        statusCounts ??
        [
          const ShipmentStatusCountModel(count: 0),
          const ShipmentStatusCountModel(count: 0),
          const ShipmentStatusCountModel(count: 0),
          const ShipmentStatusCountModel(count: 0),
          const ShipmentStatusCountModel(count: 0),
          const ShipmentStatusCountModel(count: 0),
          const ShipmentStatusCountModel(count: 0),
        ];

    return RefreshIndicator(
      onRefresh: () async {
        context.read<ShipmentTrackingCubit>().getShipmentStatusCounts();
      },
      child: GridView.builder(
        itemCount: displayCounts.length + 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppSizes.w12,
          mainAxisSpacing: AppSizes.h12,
          childAspectRatio: 1.1,
        ),
        itemBuilder: (context, index) {
          if (index == displayCounts.length) {
            return const ShipmentsTrackingAllShipmentsCard();
          }

          final item = displayCounts[index];
          return ShipmentsTrackingStatusCard(
            title: item.status?.name ?? '...',
            count: item.count ?? 0,
            status: item.status,
          );

        },
      ),
    );
  }
}
