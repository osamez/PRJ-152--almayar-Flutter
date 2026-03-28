import 'package:almeyar/core/utils/exports.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.label,
    required this.color,
    this.width,
    this.height,
    this.iconPath,
  });

  final String label;
  final Color color;
  final double? width;
  final double? height;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w10,
        vertical: AppSizes.h4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconPath != null
              ? SvgPicture.asset(
                  iconPath!,
                  width: height,
                  height: height,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                )
              : Container(
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
