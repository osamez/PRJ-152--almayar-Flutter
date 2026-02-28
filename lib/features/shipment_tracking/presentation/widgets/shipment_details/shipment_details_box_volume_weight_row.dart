part of '../../feature_imports.dart';

class ShipmentDetailsBoxVolumeWeightRow extends StatelessWidget {
  const ShipmentDetailsBoxVolumeWeightRow({
    super.key,
    required this.totalVolume,
    required this.totalWeight,
  });

  final String totalVolume;
  final String totalWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _BoxStatItem(
            iconPath: AppAssets.svgBarbell,
            label: LocaleKeys.shipment_details_total_weight_label.tr(),
            value: totalWeight,
          ),
        ),
        Container(width: 1.5, height: AppSizes.h14, color: AppColors.orange),

        horizontalSpace(AppSizes.w12),

        Expanded(
          child: _BoxStatItem(
            iconPath: AppAssets.svgThree,
            label: LocaleKeys.shipment_details_total_volume_label.tr(),
            value: totalVolume,
          ).center,
        ),
      ],
    );
  }
}

class _BoxStatItem extends StatelessWidget {
  const _BoxStatItem({
    required this.iconPath,
    required this.label,
    required this.value,
  });

  final String iconPath;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: AppSizes.w16,
          height: AppSizes.h16,
          colorFilter: const ColorFilter.mode(
            AppColors.deepViolet,
            BlendMode.srcIn,
          ),
        ),
        horizontalSpace(AppSizes.w6),
        Flexible(
          child: Text(
            '$label:$value',
            style: AppTextStyleFactory.create(
              size: 10,
              weight: FontWeight.w700,
              color: AppColors.deepViolet,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
