part of '../../feature_imports.dart';

class ShipmentDetailsBoxStatusBadges extends StatelessWidget {
  const ShipmentDetailsBoxStatusBadges({super.key, required this.statusLabel});

  final String statusLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizes.h8,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildBoxDetails(
          label: statusLabel,
          titleColor: AppColors.darkText,
          svgPath: AppAssets.svgDot,
          backgroundColor: const Color(0xff3A2A85).withValues(alpha: 0.16),
          iconWidth: AppSizes.w8,
          iconHeight: AppSizes.h8,
        ),
        _buildBoxDetails(
          label: LocaleKeys.shipment_details_box_image_label.tr(),
          titleColor: AppColors.white,
          svgPath: AppAssets.svgEyes,
          backgroundColor: AppColors.orange,
          iconWidth: AppSizes.w12,
          iconHeight: AppSizes.h12,
        ),
      ],
    );
  }

  Widget _buildBoxDetails({
    required String label,
    required Color titleColor,
    required String svgPath,
    required Color backgroundColor,
    required double iconWidth,
    required double iconHeight,
  }) {
    return Container(
      width: AppSizes.w100,

      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w10,
        vertical: AppSizes.h4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svgPath, width: iconWidth, height: iconHeight),
          horizontalSpace(AppSizes.w6),
          Text(
            label,
            style: AppTextStyleFactory.create(
              size: 10,
              weight: FontWeight.w600,
              color: titleColor,
            ),
          ),
        ],
      ),
    );
  }
}
