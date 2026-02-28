part of '../../feature_imports.dart';

class ShipmentDetailsBoxCard extends StatelessWidget {
  const ShipmentDetailsBoxCard({
    super.key,
    required this.statusLabel,
    required this.date,
    required this.shippingType,
    required this.totalVolume,
    required this.totalWeight,
    required this.boxCode,
    required this.dimensions,
    required this.shipmentCode,
    required this.tripCode,
    required this.boxPrice,
    required this.discount,
    required this.dueAmount,
  });

  final String statusLabel;
  final String date;
  final String shippingType;
  final String totalVolume;
  final String totalWeight;
  final String boxCode;
  final String dimensions;
  final String shipmentCode;
  final String tripCode;
  final String boxPrice;
  final String discount;
  final String dueAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.w16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ShipmentDetailsBoxHeaderRow(
                    date: date,
                    shippingType: shippingType,
                  ),
                ),
                ShipmentDetailsBoxStatusBadges(statusLabel: statusLabel),
              ],
            ),
            verticalSpace(AppSizes.h12),
            Divider(height: 1, color: AppColors.gray.withValues(alpha: 0.5)),
            verticalSpace(AppSizes.h12),
            ShipmentDetailsBoxVolumeWeightRow(
              totalVolume: totalVolume,
              totalWeight: totalWeight,
            ),
            verticalSpace(AppSizes.h12),
            Divider(height: 1, color: AppColors.gray.withValues(alpha: 0.5)),
            verticalSpace(AppSizes.h8),
            ShipmentDetailsBoxInfoRow(
              icon: AppAssets.svgCalendar,
              label: LocaleKeys.shipment_details_box_code.tr(),
              value: boxCode,
            ),
            ShipmentDetailsBoxInfoRow(
              icon: AppAssets.svgThree,
              isDimensions: true,
              label: LocaleKeys.shipment_details_dimensions.tr(),
              value: dimensions,
            ),
            ShipmentDetailsBoxInfoRow(
              icon: AppAssets.svgCalendar,
              label: LocaleKeys.shipment_details_shipment_code_label.tr(),
              value: shipmentCode,
            ),
            ShipmentDetailsBoxInfoRow(
              icon: AppAssets.svgCalendar,
              label: LocaleKeys.shipment_details_trip_code.tr(),
              value: tripCode,
            ),
            verticalSpace(AppSizes.h8),
            Divider(height: 1, color: AppColors.gray.withValues(alpha: 0.5)),
            verticalSpace(AppSizes.h12),
            ShipmentDetailsBoxPricingRow(
              boxPrice: boxPrice,
              discount: discount,
              dueAmount: dueAmount,
            ),
          ],
        ),
      ),
    );
  }
}
