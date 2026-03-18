part of '../../feature_imports.dart';

class RequestItemDetailsBoxStatusBadge extends StatelessWidget {
  const RequestItemDetailsBoxStatusBadge({
    super.key,
    required this.statusLabel,
  });

  final String statusLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.w100,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w10,
        vertical: AppSizes.h4,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff3A2A85).withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.svgDot,
            width: AppSizes.w8,
            height: AppSizes.h8,
          ),
          horizontalSpace(AppSizes.w6),
          Text(
            statusLabel,
            style: AppTextStyleFactory.create(
              size: 10,
              weight: FontWeight.w600,
              color: AppColors.darkText,
            ),
          ),
        ],
      ),
    );
  }
}
