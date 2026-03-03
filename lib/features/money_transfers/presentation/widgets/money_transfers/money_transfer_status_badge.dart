part of '../../feature_imports.dart';

class MoneyTransferStatusBadge extends StatelessWidget {
  const MoneyTransferStatusBadge({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppAssets.svgDot,
            width: AppSizes.w8,
            height: AppSizes.h8,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          horizontalSpace(AppSizes.w4),
          Text(
            label,
            style: AppTextStyleFactory.create(
              size: AppSizes.h10,
              weight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
