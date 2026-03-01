part of '../../feature_imports.dart';

class ShipmentsTypeShippingTabs extends StatelessWidget {
  const ShipmentsTypeShippingTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShipmentTrackingCubit, ShipmentTrackingState>(
      buildWhen: (previous, current) =>
          previous.selectedTabIndex != current.selectedTabIndex,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: AppElevatedButton(
                text: LocaleKeys.shipment_tracking_air_shipping.tr(),
                onPressed: () =>
                    context.read<ShipmentTrackingCubit>().changeTab(0),
                backgroundColor: state.selectedTabIndex == 0
                    ? AppColors.orange
                    : AppColors.white,
                borderColor: state.selectedTabIndex == 0
                    ? AppColors.orange
                    : AppColors.gray,
                textColor: state.selectedTabIndex == 0
                    ? AppColors.white
                    : AppColors.darkSlate,
              ),
            ),
            horizontalSpace(AppSizes.w12),
            Expanded(
              child: AppElevatedButton(
                text: LocaleKeys.shipment_tracking_sea_shipping.tr(),
                onPressed: () =>
                    context.read<ShipmentTrackingCubit>().changeTab(1),
                backgroundColor: state.selectedTabIndex == 1
                    ? AppColors.orange
                    : AppColors.white,
                borderColor: state.selectedTabIndex == 1
                    ? AppColors.orange
                    : AppColors.gray,
                textColor: state.selectedTabIndex == 1
                    ? AppColors.white
                    : AppColors.darkSlate,
              ),
            ),
          ],
        );
      },
    );
  }
}
