part of '../../feature_imports.dart';

class ShipmentPickupRequestsViewBody extends StatelessWidget {
  const ShipmentPickupRequestsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(AppSizes.h32),
        const PickupSearchBar().withPadding(horizontal: AppSizes.w20),
        verticalSpace(AppSizes.h16),
        const PickupShippingTypeTabs().withPadding(horizontal: AppSizes.w20),
        verticalSpace(AppSizes.h20),
        AppElevatedButton(
          onPressed: () => context.push(Routes.requestReceiveShipmentView),
          text: 'إضافة طلب جديدة',
          iconPath: AppAssets.svgAdd,
          iconWidth: AppSizes.w18,
          iconHeight: AppSizes.h18,
          backgroundColor: AppColors.deepViolet,
        ).withPadding(horizontal: AppSizes.w20),
        verticalSpace(AppSizes.h20),
        const PickupFilterHeader().withPadding(horizontal: AppSizes.w20),
        verticalSpace(AppSizes.h16),
        const Expanded(child: PickupRequestsListView()),
      ],
    );
  }
}
