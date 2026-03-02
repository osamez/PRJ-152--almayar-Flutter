part of '../../feature_imports.dart';

class PurchaseOrderInfoRow extends StatelessWidget {
  const PurchaseOrderInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final String icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: AppSizes.w16,
          height: AppSizes.h16,
          colorFilter: const ColorFilter.mode(
            AppColors.deepViolet,
            BlendMode.srcIn,
          ),
        ),
        horizontalSpace(AppSizes.w6),
        Expanded(
          child: Row(
            spacing: AppSizes.w4,
            children: [
              Text(
                label,
                style: AppTextStyleFactory.create(
                  size: 10,
                  weight: FontWeight.w700,
                  color: AppColors.deepViolet,
                ),
              ),
              Flexible(
                child: Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyleFactory.create(
                    size: 10,
                    weight: FontWeight.w400,
                    color: AppColors.deepViolet,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
