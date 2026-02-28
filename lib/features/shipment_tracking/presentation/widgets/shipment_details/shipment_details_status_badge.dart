part of '../../feature_imports.dart';

class ShipmentDetailsStatusBadge extends StatelessWidget {
  const ShipmentDetailsStatusBadge({
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
        vertical: AppSizes.h4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppSizes.w8,
            height: AppSizes.h8,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CircleAvatar(radius: 2, backgroundColor: color),
            ),
          ),
          horizontalSpace(AppSizes.w6),
          Text(
            label,
            style: AppTextStyleFactory.create(
              size: 12,
              weight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
