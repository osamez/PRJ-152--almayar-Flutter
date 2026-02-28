part of '../../feature_imports.dart';

class ShipmentDetailsRouteSection extends StatelessWidget {
  const ShipmentDetailsRouteSection({
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
    return Row(
      children: [
        Expanded(
          child: ShipmentDetailsLocationLabel(
            warehouse: destinationWarehouse,
            country: destinationCountry,
          ),
        ),
        Expanded(
          flex: 2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 1,
                margin: EdgeInsets.symmetric(horizontal: AppSizes.w4),
                decoration: BoxDecoration(
                  color: AppColors.notActive,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              Container(
                width: AppSizes.w24,
                height: AppSizes.h24,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.orange, width: 1.5),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.svgBoat,
                    width: AppSizes.w14,
                    height: AppSizes.h14,
                    colorFilter: const ColorFilter.mode(
                      AppColors.orange,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ShipmentDetailsLocationLabel(
            warehouse: originWarehouse,
            country: originCountry,
          ),
        ),
      ],
    );
  }
}
