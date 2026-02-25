part of '../../feature_imports.dart';

class PickupRequestStatusBadge extends StatelessWidget {
  const PickupRequestStatusBadge({super.key, required this.status});

  final PickupRequestStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w10,
        vertical: AppSizes.h8,
      ),
      decoration: BoxDecoration(
        color: status.backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.w2),
            width: AppSizes.w8,
            height: AppSizes.h8,
            decoration: BoxDecoration(
              color: status.color.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CircleAvatar(radius: 2, backgroundColor: status.color),
            ),
          ),
          horizontalSpace(AppSizes.w6),
          Text(
            status.label,
            style: AppTextStyleFactory.create(
              size: 14,
              weight: FontWeight.w600,
              color: status.color,
            ),
          ),
        ],
      ),
    );
  }
}
