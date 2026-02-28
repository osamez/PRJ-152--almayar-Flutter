part of '../../feature_imports.dart';

class ShipmentDetailsStatCard extends StatelessWidget {
  const ShipmentDetailsStatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final String icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w2,
        vertical: AppSizes.h12,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            width: AppSizes.w32,
            height: AppSizes.h32,
            colorFilter: const ColorFilter.mode(
              AppColors.darkText,
              BlendMode.srcIn,
            ),
          ),
          verticalSpace(AppSizes.h8),
          Text(
            label,
            style: AppTextStyleFactory.create(
              size: 10,
              weight: FontWeight.w700,
              color: AppColors.darkText,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(AppSizes.h4),
          Text(
            value,
            style: AppTextStyleFactory.create(
              size: 14,
              weight: FontWeight.w700,
              color: AppColors.deepViolet,
            ),
          ),
        ],
      ),
    );
  }
}
