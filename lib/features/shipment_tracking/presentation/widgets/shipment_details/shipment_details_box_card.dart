part of '../../feature_imports.dart';

class ShipmentDetailsBoxCard extends StatelessWidget {
  const ShipmentDetailsBoxCard({
    super.key,
    required this.shipment,
    required this.box,
  });

  final ShipmentModel shipment;
  final ShipmentBoxModel box;

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
                    date:
                        shipment.createdAt != null &&
                            shipment.createdAt!.isNotEmpty
                        ? formatDateFromApi(shipment.createdAt!)
                        : '-',
                    shippingType: shipment.shipmentWay?.name ?? '-',
                  ),
                ),
                ShipmentDetailsBoxStatusBadges(
                  statusLabel: box.status?.name ?? '',
                  boxImage: box.boxImage,
                ),
              ],
            ),
            verticalSpace(AppSizes.h12),
            ShipmentDetailsBoxVolumeWeightRow(
              totalVolume: '${box.size ?? 0} CMB',
              totalWeight: '${box.weight ?? 0} KG',
            ),
            verticalSpace(AppSizes.h12),
            Divider(height: 1, color: AppColors.gray.withValues(alpha: 0.5)),
            verticalSpace(AppSizes.h8),
            ShipmentDetailsBoxInfoRow(
              icon: AppAssets.svgCalendar,
              label: LocaleKeys.shipment_details_box_code.tr(),
              value: box.code ?? '',
            ),
            ShipmentDetailsBoxInfoRow(
              icon: AppAssets.svgThree,
              isDimensions: true,
              label: LocaleKeys.shipment_details_dimensions.tr(),
              value:
                  '${box.dimensions?.length ?? 0}سم ,${box.dimensions?.width ?? 0}سم ,${box.dimensions?.height ?? 0}سم',
            ),
            ShipmentDetailsBoxInfoRow(
              icon: AppAssets.svgCalendar,
              label: LocaleKeys.shipment_details_shipment_code_label.tr(),
              value: shipment.code ?? '',
            ),
            ShipmentDetailsBoxInfoRow(
              icon: AppAssets.svgCalendar,
              label: LocaleKeys.shipment_details_trip_code.tr(),
              value: box.tripCode ?? '',
            ),
            verticalSpace(AppSizes.h8),
            Divider(height: 1, color: AppColors.gray.withValues(alpha: 0.5)),
            verticalSpace(AppSizes.h12),
            ShipmentDetailsBoxPricingRow(
              boxPrice: '\$${box.price ?? 0}',
              discount: '\$${box.discountValue ?? 0}',
              dueAmount: '\$${box.priceAfterDiscount ?? 0}',
            ),
          ],
        ),
      ),
    );
  }
}
