part of '../../feature_imports.dart';

class ShipmentsTypeViewBody extends StatelessWidget {
  const ShipmentsTypeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShipmentTrackingCubit, ShipmentTrackingState>(
      builder: (context, state) {
        return Column(
          children: [
            verticalSpace(AppSizes.h16),
            const ShipmentsTypeSearchBar().withPadding(horizontal: AppSizes.w20),
            verticalSpace(AppSizes.h16),
            const ShipmentsTypeShippingTabs().withPadding(
              horizontal: AppSizes.w20,
            ),
            verticalSpace(AppSizes.h20),
            ShipmentsTypeFilterHeader(
              resultCount: state.totalShipmentsCount,
            ).withPadding(horizontal: AppSizes.w20),
            verticalSpace(AppSizes.h16),
            const Expanded(child: ShipmentsTypeShipmentList()),
          ],
        );
      },
    );
  }
}
