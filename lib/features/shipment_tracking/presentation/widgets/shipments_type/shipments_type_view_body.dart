part of '../../feature_imports.dart';

class ShipmentsTypeViewBody extends StatelessWidget {
  const ShipmentsTypeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(AppSizes.h16),
        const ShipmentsTypeSearchBar().withPadding(horizontal: AppSizes.w20),
        verticalSpace(AppSizes.h16),
        const ShipmentsTypeShippingTabs().withPadding(horizontal: AppSizes.w20),
        verticalSpace(AppSizes.h20),
        const ShipmentsTypeFilterHeader(
          resultCount: 3,
        ).withPadding(horizontal: AppSizes.w20),
        verticalSpace(AppSizes.h16),
        const Expanded(child: ShipmentsTypeShipmentList()),
      ],
    );
  }
}
