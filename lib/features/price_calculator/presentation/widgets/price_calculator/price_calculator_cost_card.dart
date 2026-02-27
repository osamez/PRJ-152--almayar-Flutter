part of '../../feature_imports.dart';

class PriceCalculatorCostCard extends StatelessWidget {
  const PriceCalculatorCostCard({
    super.key,
    required this.title,
    required this.value,
    required this.iconPath,
  });

  final String title;
  final String value;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.gray),
      ),
      child: Row(
        children: [
          CustomIconRoundedBox(
            iconPath: iconPath,
            width: AppSizes.w48,
            height: AppSizes.h48,
            iconColor: AppColors.deepViolet,
            backgroundColor: AppColors.grey97,
          ),

          horizontalSpace(AppSizes.w12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyleFactory.create(
                    size: 16,
                    weight: FontWeight.w700,
                    color: AppColors.darkSlate,
                  ),
                ),
                verticalSpace(AppSizes.h4),
                Text(
                  value,
                  style: AppTextStyleFactory.create(
                    size: 12,
                    weight: FontWeight.w400,
                    color: AppColors.darkSlate,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
