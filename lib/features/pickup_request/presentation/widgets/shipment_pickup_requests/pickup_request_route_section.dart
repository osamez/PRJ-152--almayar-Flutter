part of '../../feature_imports.dart';

class PickupRequestRouteSection extends StatelessWidget {
  const PickupRequestRouteSection({
    super.key,
    required this.originWarehouse,
    required this.originCountry,
    required this.destinationWarehouse,
    required this.destinationCountry,
  });

  final String originWarehouse;
  final String originCountry;
  final String destinationWarehouse;
  final String destinationCountry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h12,
      ),
      child: Row(
        children: [
          Expanded(
            child: RouteLocationLabel(
              warehouse: destinationWarehouse,
              country: destinationCountry,
            ),
          ),
          const Expanded(flex: 2, child: RouteDividerWithIcon()),
          Expanded(
            child: RouteLocationLabel(
              warehouse: originWarehouse,
              country: originCountry,
            ),
          ),
        ],
      ),
    );
  }
}
