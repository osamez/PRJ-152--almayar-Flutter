part of '../../feature_imports.dart';

class PurchaseOrderStatusBadge extends StatelessWidget {
  const PurchaseOrderStatusBadge({
    super.key,
    required this.status,
  });

  final StatusModel? status;

  Color _getStatusColor() {
    switch (status?.color?.toLowerCase()) {
      case 'success':
        return AppColors.green;
      case 'warning':
        return AppColors.yellow;
      case 'danger':
        return AppColors.error500;
      case 'primary':
        return AppColors.lightViolet;
      default:
        return AppColors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor();
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
            status?.name ?? '',
            style: AppTextStyleFactory.create(
              size: 10,
              weight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
