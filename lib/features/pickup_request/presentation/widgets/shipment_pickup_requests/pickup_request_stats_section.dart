part of '../../feature_imports.dart';

class PickupRequestStatsSection extends StatelessWidget {
  const PickupRequestStatsSection({
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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h12,
      ),
      child: Row(
        children: [
          PickupRequestStatItem(
            icon: AppAssets.svgBox,
            label: LocaleKeys.pickup_requests_boxes_count.tr(),
            value: boxesCount,
          ),
          const Spacer(),
          const PickupRequestStatsDivider(),
          const Spacer(),
          PickupRequestStatItem(
            icon: AppAssets.svgThree,
            label: LocaleKeys.pickup_requests_total_volume.tr(),
            value: totalVolume,
          ),
          const Spacer(),
          const PickupRequestStatsDivider(),
          const Spacer(),
          PickupRequestStatItem(
            icon: AppAssets.svgBarbell,
            label: LocaleKeys.pickup_requests_total_weight.tr(),
            value: totalWeight,
          ),
        ],
      ),
    );
  }
}
