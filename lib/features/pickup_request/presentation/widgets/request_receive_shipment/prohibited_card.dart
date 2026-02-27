part of '../../feature_imports.dart';

class ProhibitedCard extends StatelessWidget {
  const ProhibitedCard({
    super.key,
    required this.subTitle,
    required this.onTap,
  });

  final String subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w20,
          vertical: AppSizes.h15,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        ),
        child: Row(
          children: [
            const CustomIconRoundedBox(iconPath: AppAssets.svgBlocked),
            horizontalSpace(AppSizes.w10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.request_shipment_prohibited_materials.tr(),
                    style: AppTextStyleFactory.create(
                      size: AppSizes.h16,
                      weight: FontWeight.bold,
                      color: AppColors.darkSlate,
                    ),
                  ),
                  verticalSpace(AppSizes.h4),
                  Text(
                    subTitle,
                    style: AppTextStyleFactory.create(
                      size: AppSizes.h12,
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
            ),
          ],
        ),
      ),
    );
  }
}
