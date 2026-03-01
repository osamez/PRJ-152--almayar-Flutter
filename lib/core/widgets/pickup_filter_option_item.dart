import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/core/widgets/custom_icon_rounded_box.dart';

class PickupFilterOptionItem extends StatelessWidget {
  const PickupFilterOptionItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w16,
          vertical: AppSizes.h18,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.orange.withValues(alpha: 0.07)
              : AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          border: Border.all(
            color: isSelected ? AppColors.orange : AppColors.deepViolet,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomIconRoundedBox(
              width: AppSizes.w48,
              height: AppSizes.h48,
              iconPath: AppAssets.svgAirplane,
              iconColor: isSelected ? AppColors.orange : AppColors.deepViolet,
              backgroundColor: isSelected
                  ? AppColors.offWhite
                  : AppColors.grey97,
            ),

            horizontalSpace(AppSizes.w12),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.start,
                style: AppTextStyleFactory.create(
                  size: 14,
                  weight: isSelected ? FontWeight.w700 : FontWeight.w400,
                  color: isSelected ? AppColors.orange : AppColors.darkSlate,
                ),
              ),
            ),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isSelected
                  ? Icon(
                      Icons.check_circle_rounded,
                      key: const ValueKey('checked'),
                      color: AppColors.orange,
                      size: AppSizes.w24,
                    )
                  : SizedBox(
                      key: const ValueKey('unchecked'),
                      width: AppSizes.w24,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
