part of '../../feature_imports.dart';

class ShipmentDetailsBoxStatusBadges extends StatelessWidget {
  const ShipmentDetailsBoxStatusBadges({
    super.key,
    required this.status,
    this.boxImage,
  });

  final PickupRequestStatus status;
  final String? boxImage;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        spacing: AppSizes.h8,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildBoxDetails(
            label: status.label,
            titleColor: AppColors.darkText,
            svgPath: AppAssets.svgDot,
            backgroundColor: status.color.withValues(alpha: 0.16),
            iconWidth: AppSizes.w8,
            iconHeight: AppSizes.h8,
          ),
          GestureDetector(
            onTap: () {
              if (boxImage == null) {
                return;
              }
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: EdgeInsets.zero,
                  child: Stack(
                    children: [
                      Center(
                        child: InteractiveViewer(
                          child: CustomCachedImage(
                            imageUrl: boxImage!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        top: AppSizes.h40,
                        right: AppSizes.w16,
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: AppColors.white,
                            size: 30,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: _buildBoxDetails(
              label: LocaleKeys.shipment_details_box_image_label.tr(),
              titleColor: AppColors.white,
              svgPath: AppAssets.svgEyes,
              backgroundColor: AppColors.orange,
              iconWidth: AppSizes.w12,
              iconHeight: AppSizes.h12,
            ),
          ),
        ],
      ),
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
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w8,
        vertical: AppSizes.h5,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svgPath, width: iconWidth, height: iconHeight),
          horizontalSpace(AppSizes.w6),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyleFactory.create(
                size: 12,
                weight: FontWeight.w600,
                color: titleColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
