part of '../../feature_imports.dart';

class DetailsInspectionCard extends StatelessWidget {
  const DetailsInspectionCard({super.key, required this.isEnabled});

  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h14,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CustomIconRoundedBox(
            width: AppSizes.w44,
            height: AppSizes.h44,
            iconPath: AppAssets.svgCube,
            iconColor: AppColors.green,
            backgroundColor: AppColors.grey,
          ),
          horizontalSpace(AppSizes.w24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.shipment_details_inspection_service.tr(),
                style: AppTextStyleFactory.create(
                  size: 16,
                  weight: FontWeight.w700,
                  color: AppColors.deepViolet,
                ),
              ),
              verticalSpace(AppSizes.h4),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.w8,
                  vertical: AppSizes.h2,
                ),
                decoration: BoxDecoration(
                  color: isEnabled
                      ? AppColors.green.withValues(alpha: 0.1)
                      : AppColors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusXxs),
                ),
                child: Text(
                  isEnabled
                      ? LocaleKeys.shipment_details_inspection_enabled.tr()
                      : LocaleKeys.shipment_details_inspection_disabled.tr(),
                  style: AppTextStyleFactory.create(
                    size: 12,
                    weight: FontWeight.w600,
                    color: isEnabled ? AppColors.green : AppColors.orange,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
