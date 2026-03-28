part of '../../feature_imports.dart';

class RequestItemDetailsBoxPricingItem extends StatelessWidget {
  const RequestItemDetailsBoxPricingItem({
    super.key,
    required this.label,
    required this.value,
    required this.valueColor,
    required this.icon,
  });

  final String label;
  final String value;
  final Color valueColor;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icon, width: AppSizes.w18, height: AppSizes.w18),
        horizontalSpace(AppSizes.w6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyleFactory.create(
                size: 11,
                weight: FontWeight.w700,
                color: AppColors.deepViolet,
              ),
            ),
            verticalSpace(AppSizes.h4),
            Text(
              value,
              style: AppTextStyleFactory.create(
                size: 11,
                weight: FontWeight.w700,
                color: valueColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
