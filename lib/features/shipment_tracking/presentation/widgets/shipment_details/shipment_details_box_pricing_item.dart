part of '../../feature_imports.dart';

class ShipmentDetailsBoxPricingItem extends StatelessWidget {
  const ShipmentDetailsBoxPricingItem({
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
        SvgPicture.asset(icon, width: AppSizes.w16, height: AppSizes.h16),
        horizontalSpace(AppSizes.w6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyleFactory.create(
                size: 10,
                weight: FontWeight.w700,
                color: AppColors.darkText,
              ),
            ),
            verticalSpace(AppSizes.h4),
            Text(
              value,
              style: AppTextStyleFactory.create(
                size: 14,
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
