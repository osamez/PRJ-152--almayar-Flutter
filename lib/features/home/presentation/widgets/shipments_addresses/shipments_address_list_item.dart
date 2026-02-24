part of '../../feature_imports.dart';

class ShipmentsAddressListItem extends StatelessWidget {
  const ShipmentsAddressListItem({
    super.key,
    required this.arabicName,
    required this.englishName,
    required this.flagAsset,
  });

  final String arabicName;
  final String englishName;
  final String flagAsset;

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

        onTap: () => context.pushNamed(Routes.shipmentAddressDetails),
        child: Row(
          children: [
            Flexible(
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
                  flagAsset,
                  width: AppSizes.w32,
                  height: AppSizes.h32,
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
                    arabicName,
                    maxLines: 1,
                    style: AppTextStyleFactory.create(
                      size: 16,
                      weight: FontWeight.w700,
                      color: AppColors.darkSlate,
                    ),
                  ),
                  verticalSpace(AppSizes.h4),
                  Text(
                    englishName,
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
