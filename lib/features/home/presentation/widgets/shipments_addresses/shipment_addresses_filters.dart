part of '../../feature_imports.dart';

class ShipmentAddressesFilters extends StatelessWidget {
  const ShipmentAddressesFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppElevatedButton(
            text: LocaleKeys.shipments_air_filter.tr(),
            textStyle: AppTextStyleFactory.create(
              size: 10,
              weight: FontWeight.w700,
              color: AppColors.white,
            ),
            onPressed: () {},
          ),
        ),
        horizontalSpace(AppSizes.w10),
        Expanded(
          child: AppElevatedButton(
            text: LocaleKeys.shipments_sea_filter.tr(),
            backgroundColor: AppColors.white,
            textStyle: AppTextStyleFactory.create(
              size: 10,
              weight: FontWeight.w700,
              color: AppColors.deepViolet,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
