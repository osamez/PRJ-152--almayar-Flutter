part of '../../feature_imports.dart';

class RequestItemDetailsBoxCard extends StatelessWidget {
  const RequestItemDetailsBoxCard({
    super.key,
    required this.box,
    required this.order,
  });

  final BoxModel box;
  final DeliveryOrderDetailsModel order;
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
                  child: RequestItemDetailsBoxHeaderRow(
                    date: box.deliveryDate ?? '-',
                    shippingType: '-',
                  ),
                ),
                ShipmentDetailsBoxStatusBadges(
                  status: mapStatus(box.status),
                  boxImage: box.boxImage,
                ),
              ],
            ),
            verticalSpace(AppSizes.h12),
            Divider(height: 1, color: AppColors.gray.withValues(alpha: 0.5)),
            verticalSpace(AppSizes.h12),
            RequestItemDetailsBoxVolumeWeightRow(
              totalVolume: '${box.size ?? '0'} CMB',
              totalWeight: '${box.weight ?? '0'} KG',
            ),
            verticalSpace(AppSizes.h12),
            Divider(height: 1, color: AppColors.gray.withValues(alpha: 0.5)),
            verticalSpace(AppSizes.h8),
            RequestItemDetailsBoxInfoRow(
              icon: AppAssets.svgCalendar,
              label: LocaleKeys.shipment_details_box_code.tr(),
              value: box.code ?? '-',
            ),
            RequestItemDetailsBoxInfoRow(
              icon: AppAssets.svgThree,
              isDimensions: true,
              label: LocaleKeys.shipment_details_dimensions.tr(),
              value:
                  '${box.dimensions?.width ?? '0'} سم x ${box.dimensions?.height ?? '0'} سم x ${box.dimensions?.length ?? '0'} سم',
            ),
            RequestItemDetailsBoxInfoRow(
              icon: AppAssets.svgCalendar,
              label: LocaleKeys.shipment_details_shipment_code_label.tr(),
              value: order.code ?? '-',
            ),
            RequestItemDetailsBoxInfoRow(
              icon: AppAssets.svgCalendar,
              label: LocaleKeys.shipment_details_trip_code.tr(),
              value: box.tripCode ?? '-',
            ),
            verticalSpace(AppSizes.h8),
            Divider(height: 1, color: AppColors.gray.withValues(alpha: 0.5)),
            verticalSpace(AppSizes.h12),
            RequestItemDetailsBoxPricingRow(
              boxPrice: '${box.price ?? '0'}\$',
              discount: '${box.discountValue ?? '0'}\$',
              dueAmount: '${box.priceAfterDiscount ?? '0'}\$',
            ),
          ],
        ),
      ),
    );
  }
}
