part of '../../feature_imports.dart';

class ShipmentDetailsHeaderCard extends StatelessWidget {
  const ShipmentDetailsHeaderCard({
    super.key,
    required this.shipmentCode,
    required this.statusLabel,
    required this.date,
    required this.shippingType,
    required this.originWarehouse,
    required this.originCountry,
    required this.destinationWarehouse,
    required this.destinationCountry,
  });

  final String shipmentCode;
  final String statusLabel;
  final String date;
  final String shippingType;
  final String originWarehouse;
  final String originCountry;
  final String destinationWarehouse;
  final String destinationCountry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
      child: Column(
        children: [
          ShipmentDetailsHeaderInfo(
            shipmentCode: shipmentCode,
            date: date,
            shippingType: shippingType,
          ),
          verticalSpace(AppSizes.h16),
          ShipmentDetailsRouteSection(
            originWarehouse: originWarehouse,
            originCountry: originCountry,
            destinationWarehouse: destinationWarehouse,
            destinationCountry: destinationCountry,
          ),
          verticalSpace(AppSizes.h12),
        ],
      ),
    );
  }
}
