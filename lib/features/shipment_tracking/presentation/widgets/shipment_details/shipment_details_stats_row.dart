part of '../../feature_imports.dart';

class ShipmentDetailsStatsRow extends StatelessWidget {
  const ShipmentDetailsStatsRow({
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
          child: ShipmentDetailsStatCard(
            icon: AppAssets.svgBox,
            label: LocaleKeys.shipment_details_boxes_count_label.tr(),
            value: boxesCount,
          ),
        ),
        horizontalSpace(AppSizes.w12),
        Expanded(
          child: ShipmentDetailsStatCard(
            icon: AppAssets.svgThree,
            label: LocaleKeys.shipment_details_final_volume_cbm.tr(),
            value: totalVolume,
          ),
        ),
        horizontalSpace(AppSizes.w12),
        Expanded(
          child: ShipmentDetailsStatCard(
            icon: AppAssets.svgBarbell,
            label: LocaleKeys.shipment_details_final_weight_kg.tr(),
            value: totalWeight,
          ),
        ),
      ],
    );
  }
}
