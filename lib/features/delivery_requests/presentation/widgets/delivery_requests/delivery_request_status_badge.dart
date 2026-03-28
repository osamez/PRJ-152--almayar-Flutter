part of '../../feature_imports.dart';

class DeliveryRequestStatusBadge extends StatelessWidget {
  const DeliveryRequestStatusBadge({
    super.key,
    required this.label,
    required this.color,
    required this.iconPath,
    required this.iconWidth,
    required this.iconHeight,
  });

  final String label;
  final Color color;
  final String iconPath;
  final double iconWidth;
  final double iconHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w10,
        vertical: AppSizes.h5,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppSizes.radiusXs),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: iconWidth,
              height: iconHeight,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            horizontalSpace(AppSizes.w4),
            Text(
              label,
              style: AppTextStyleFactory.create(
                size: 10,
                weight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
