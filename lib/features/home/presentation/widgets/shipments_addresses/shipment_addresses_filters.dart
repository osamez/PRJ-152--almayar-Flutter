part of '../../feature_imports.dart';

class ShipmentAddressesFilters extends StatelessWidget {
  const ShipmentAddressesFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ShipmentsAddressesCubit, ShipmentsAddressesState,
        String>(
      selector: (state) => state.selectedFilter,
      builder: (context, selectedFilter) {
        final isAir = selectedFilter == 'air';
        return Row(
          children: [
            Expanded(
              child: AppElevatedButton(
                text: LocaleKeys.shipments_air_filter.tr(),
                backgroundColor: isAir ? AppColors.deepViolet : AppColors.white,
                textStyle: AppTextStyleFactory.create(
                  size: 10,
                  weight: FontWeight.w700,
                  color: isAir ? AppColors.white : AppColors.deepViolet,
                ),
                onPressed: () =>
                    context.read<ShipmentsAddressesCubit>().selectFilter('air'),
              ),
            ),
            horizontalSpace(AppSizes.w10),
            Expanded(
              child: AppElevatedButton(
                text: LocaleKeys.shipments_sea_filter.tr(),
                backgroundColor: !isAir ? AppColors.deepViolet : AppColors.white,
                textStyle: AppTextStyleFactory.create(
                  size: 10,
                  weight: FontWeight.w700,
                  color: !isAir ? AppColors.white : AppColors.deepViolet,
                ),
                onPressed: () =>
                    context.read<ShipmentsAddressesCubit>().selectFilter('sea'),
              ),
            ),
          ],
        );
      },
    );
  }
}
