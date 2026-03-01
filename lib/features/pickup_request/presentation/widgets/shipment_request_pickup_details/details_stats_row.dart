part of '../../feature_imports.dart';

class DetailsStatsRow extends StatelessWidget {
  const DetailsStatsRow({
    super.key,
    required this.boxesCount,
    required this.totalVolume,
    required this.totalWeight,
  });

  final String boxesCount;
  final String totalVolume;
  final String totalWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: AppAssets.svgBox,
            label: LocaleKeys.shipment_details_boxes_count.tr(),
            value: boxesCount,
          ),
        ),
        horizontalSpace(AppSizes.w12),
        Expanded(
          child: _StatCard(
            icon: AppAssets.svgThree,
            label: LocaleKeys.shipment_details_volume_cbm.tr(),
            value: totalVolume,
          ),
        ),
        horizontalSpace(AppSizes.w12),
        Expanded(
          child: _StatCard(
            icon: AppAssets.svgBarbell,
            label: LocaleKeys.shipment_details_weight_kg.tr(),
            value: totalWeight,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final String icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w8,
        vertical: AppSizes.h12,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withValues(alpha: 0.04),
        //     blurRadius: 8,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            width: AppSizes.w32,
            height: AppSizes.h32,
            colorFilter: const ColorFilter.mode(
              AppColors.deepViolet,
              BlendMode.srcIn,
            ),
          ),
          verticalSpace(AppSizes.h8),
          Text(
            label,
            style: AppTextStyleFactory.create(
              size: 10,
              weight: FontWeight.w400,
              color: AppColors.deepViolet,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(AppSizes.h4),
          Text(
            value,
            style: AppTextStyleFactory.create(
              size: 14,
              weight: FontWeight.w700,
              color: AppColors.deepViolet,
            ),
          ),
        ],
      ),
    );
  }
}
