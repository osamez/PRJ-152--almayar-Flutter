part of '../../feature_imports.dart';

class ShipmentDetailsHeaderInfo extends StatelessWidget {
  const ShipmentDetailsHeaderInfo({
    super.key,
    required this.shipmentCode,
    required this.date,
    required this.shippingType,
  });

  final String shipmentCode;
  final String date;
  final String shippingType;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconRoundedBox(
          iconPath: AppAssets.svgBox,
          backgroundColor: AppColors.grey97,
          width: AppSizes.w48,
          height: AppSizes.h48,
          iconColor: AppColors.darkText,
        ),
        horizontalSpace(AppSizes.w12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      shipmentCode,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyleFactory.create(
                        size: 12,
                        weight: FontWeight.w700,
                        color: AppColors.darkSlate,
                      ),
                    ),
                  ),
                  horizontalSpace(AppSizes.w8),
                  ShipmentDetailsStatusBadge(
                    label: LocaleKeys.shipment_details_ready_for_delivery.tr(),
                    color: AppColors.green,
                  ),
                ],
              ),
              verticalSpace(AppSizes.h6),
              IconTextRow(
                iconPath: AppAssets.svgCalendar,
                text: date,
                iconWidth: AppSizes.w16,
                iconHeight: AppSizes.h16,
                iconColor: AppColors.darkSlate,
                textSize: 10,
                textWeight: FontWeight.w700,
                textColor: AppColors.darkSlate,
              ),
              verticalSpace(AppSizes.h4),
              IconTextRow(
                iconPath: AppAssets.svgBoat,
                text: shippingType.isEmpty
                    ? LocaleKeys.shipment_details_shared_sea.tr()
                    : shippingType,
                iconWidth: AppSizes.w16,
                iconHeight: AppSizes.h16,
                iconColor: AppColors.orange,
                textSize: 10,
                textWeight: FontWeight.w700,
                textColor: AppColors.orange,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
