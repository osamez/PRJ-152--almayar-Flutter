part of '../../feature_imports.dart';

class ShipmentsTrackingTabBar extends StatelessWidget {
  const ShipmentsTrackingTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShipmentTrackingCubit, ShipmentTrackingState>(
      buildWhen: (previous, current) =>
          previous.selectedTabIndex != current.selectedTabIndex,
      builder: (context, state) {
        return Row(
          spacing: AppSizes.w10,
          children: [
            Expanded(
              child: AppElevatedButton(
                text: LocaleKeys.shipment_tracking_air_shipping.tr(),
                onPressed: () =>
                    context.read<ShipmentTrackingCubit>().changeTab(0),
                backgroundColor: state.selectedTabIndex == 0
                    ? AppColors.orange
                    : AppColors.white,
                textColor: state.selectedTabIndex == 0
                    ? AppColors.white
                    : AppColors.hintColor,
                textStyle: AppTextStyleFactory.create(
                  size: AppSizes.h14,
                  weight: FontWeight.w600,
                  color: state.selectedTabIndex == 0
                      ? AppColors.white
                      : AppColors.hintColor,
                ),
                height: AppSizes.h48,
              ),
            ),
            Expanded(
              child: AppElevatedButton(
                text: LocaleKeys.shipment_tracking_sea_shipping.tr(),
                onPressed: () =>
                    context.read<ShipmentTrackingCubit>().changeTab(1),
                backgroundColor: state.selectedTabIndex == 1
                    ? AppColors.orange
                    : AppColors.white,
                textColor: state.selectedTabIndex == 1
                    ? AppColors.white
                    : AppColors.hintColor,
                textStyle: AppTextStyleFactory.create(
                  size: AppSizes.h14,
                  weight: FontWeight.w600,
                  color: state.selectedTabIndex == 1
                      ? AppColors.white
                      : AppColors.hintColor,
                ),
                height: AppSizes.h48,
              ),
            ),
          ],
        );
      },
    );
  }
}
