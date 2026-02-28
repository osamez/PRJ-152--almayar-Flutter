part of '../../feature_imports.dart';

class ShipmentDetailsBoxInfoRow extends StatelessWidget {
  const ShipmentDetailsBoxInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.isDimensions = false,
  });

  final String icon;
  final String label;
  final String value;
  final bool isDimensions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.h6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon,
            width: AppSizes.w16,
            height: AppSizes.h16,
            colorFilter: const ColorFilter.mode(
              AppColors.darkText,
              BlendMode.srcIn,
            ),
          ),
          horizontalSpace(AppSizes.w8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$label: ',
                style: AppTextStyleFactory.create(
                  size: 10,
                  weight: FontWeight.w700,
                  color: AppColors.darkText,
                ),
              ),
              if (isDimensions)
                Text(
                  "(طول، عرض، ارتفاع)",
                  style: AppTextStyleFactory.create(
                    size: 5,
                    weight: FontWeight.w700,
                    color: AppColors.orange,
                  ),
                ),
            ],
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyleFactory.create(
                size: 10,
                weight: FontWeight.w700,
                color: AppColors.darkText,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
