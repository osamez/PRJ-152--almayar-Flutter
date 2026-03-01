part of '../../feature_imports.dart';

class ShipmentsTrackingStatusCard extends StatelessWidget {
  const ShipmentsTrackingStatusCard({
    super.key,
    required this.title,
    required this.count,
  });

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      ),

      child: CustomInkWellWidget(
        onTap: () {
          context.push(Routes.shipmentsType);
        },
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w16,
          vertical: AppSizes.h12,
        ),
        radius: AppSizes.radiusMd,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconRoundedBox(
              iconPath: AppAssets.svgBox,
              width: AppSizes.w48,
              height: AppSizes.h48,
              backgroundColor: AppColors.grey97,
              iconColor: AppColors.deepViolet,
              iconWidth: AppSizes.w24,
              iconHeight: AppSizes.h24,
              radius: AppSizes.radiusSm,
            ),
            verticalSpace(AppSizes.h10),
            Text(
              title,
              style: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.grey19,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(AppSizes.h12),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w16,
                vertical: AppSizes.h4,
              ),
              decoration: BoxDecoration(
                color: AppColors.grey98,
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              ),
              child: Text(
                '$count',
                style: AppTextStyleFactory.create(
                  size: 16,
                  weight: FontWeight.w700,
                  color: AppColors.grey19,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
