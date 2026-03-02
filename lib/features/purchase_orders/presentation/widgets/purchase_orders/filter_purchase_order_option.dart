part of '../../feature_imports.dart';

class FilterPurchaseOrderOption extends StatelessWidget {
  const FilterPurchaseOrderOption({
    super.key,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color borderColor = isSelected
        ? AppColors.orange
        : AppColors.deepViolet;

    return CustomInkWellWidget(
      onTap: onTap,
      radius: AppSizes.radiusMd,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w16,
          vertical: AppSizes.h14,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          children: [
            CustomIconRoundedBox(
              iconPath: AppAssets.svgBasket,
              width: AppSizes.w48,
              height: AppSizes.h48,
              iconColor: borderColor,
              backgroundColor: isSelected
                  ? AppColors.offWhite
                  : AppColors.grey97,
            ),

            horizontalSpace(AppSizes.w10),
            Text(
              label,
              style: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w700,
                color: isSelected ? borderColor : AppColors.deepViolet,
              ),
            ),

            const Spacer(),

            if (isSelected) ...[
              SvgPicture.asset(AppAssets.svgCheckCircle),
              horizontalSpace(AppSizes.w8),
            ],
          ],
        ),
      ),
    );
  }
}
