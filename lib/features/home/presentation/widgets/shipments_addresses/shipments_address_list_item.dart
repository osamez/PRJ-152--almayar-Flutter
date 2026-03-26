part of '../../feature_imports.dart';

class ShipmentsAddressListItem extends StatelessWidget {
  const ShipmentsAddressListItem({super.key, required this.branch});

  final BranchModel branch;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.h12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffF3F3F3),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: CustomInkWellWidget(
        padding: EdgeInsets.all(AppSizes.w12),
        radius: AppSizes.radiusLg,
        onTap: () {
          final shipmentType =
              context.read<ShipmentsAddressesCubit>().state.selectedFilter;
          context.pushNamed(
            Routes.shipmentAddressDetails,
            extra: ShipmentAddressDetailsParams(
              branchId: branch.id!,
              shipmentType: shipmentType,
            ),
          );
        },
        child: Row(
          children: [
            Flexible(
              child: Skeleton.leaf(
                child: Container(
                  width: AppSizes.w52,
                  height: AppSizes.h52,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.w10,
                    vertical: AppSizes.h10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                  ),
                  child: SvgPicture.asset(
                    AppAssets.svgFlagTest,
                    width: AppSizes.w32,
                    height: AppSizes.h32,
                  ),
                ),
              ),
            ),
            horizontalSpace(AppSizes.w10),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    branch.branchName ?? '',
                    maxLines: 1,
                    style: AppTextStyleFactory.create(
                      size: 16,
                      weight: FontWeight.w700,
                      color: AppColors.darkSlate,
                    ),
                  ),
                  verticalSpace(AppSizes.h4),
                  Text(
                    branch.countryName ?? '',
                    style: AppTextStyleFactory.create(
                      size: 12,
                      weight: FontWeight.w400,
                      color: AppColors.darkSlate,
                    ),
                  ),
                ],
              ),
            ),
            const CustomRounderArrow(
              arrowBackgroundColor: AppColors.offWhite,
              arrowColor: AppColors.deepViolet,
            ).toEnd,
          ],
        ),
      ),
    );
  }
}
