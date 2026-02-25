part of '../../feature_imports.dart';

class PickupRequestCard extends StatelessWidget {
  const PickupRequestCard({
    super.key,
    required this.status,
    required this.shipmentCode,
    required this.date,
    required this.shippingType,
    required this.originWarehouse,
    required this.originCountry,
    required this.destinationWarehouse,
    required this.destinationCountry,
    required this.boxesCount,
    required this.totalVolume,
    required this.totalWeight,
  });

  final PickupRequestStatus status;
  final String shipmentCode;
  final String date;
  final String shippingType;
  final String originWarehouse;
  final String originCountry;
  final String destinationWarehouse;
  final String destinationCountry;
  final String boxesCount;
  final String totalVolume;
  final String totalWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          PickupRequestCardHeader(
            status: status,
            shipmentCode: shipmentCode,
            date: date,
            shippingType: shippingType,
          ),
          PickupRequestRouteSection(
            originWarehouse: originWarehouse,
            originCountry: originCountry,
            destinationWarehouse: destinationWarehouse,
            destinationCountry: destinationCountry,
          ),
          Divider(height: 1, color: AppColors.gray.withValues(alpha: 0.5)),
          PickupRequestStatsSection(
            boxesCount: boxesCount,
            totalVolume: totalVolume,
            totalWeight: totalWeight,
          ),
        ],
      ),
    );
  }
}
