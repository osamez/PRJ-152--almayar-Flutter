part of '../../feature_imports.dart';

class ShipmentDetailsBoxHeaderRow extends StatelessWidget {
  const ShipmentDetailsBoxHeaderRow({
    super.key,
    required this.date,
    required this.shippingType,
  });

  final String date;
  final String shippingType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconRoundedBox(
          iconPath: shippingType.contains("جوي")
              ? AppAssets.svgAirplane
              : AppAssets.svgBoat,
          iconColor: AppColors.darkText,
          width: AppSizes.w48,

          height: AppSizes.h48,
          backgroundColor: AppColors.grey97,
        ),

        horizontalSpace(AppSizes.w12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconTextRow(
              iconPath: AppAssets.svgCalendar,
              text: date,
              iconColor: AppColors.darkText,
              textColor: AppColors.darkText,
              textWeight: FontWeight.w700,
              iconHeight: AppSizes.h18,
              iconWidth: AppSizes.w18,
              textSize: 12,
            ),
            verticalSpace(AppSizes.h4),
            IconTextRow(
              iconPath: shippingType.contains("جوي")
                  ? AppAssets.svgAirplane
                  : AppAssets.svgBoat,
              text: shippingType,
              iconColor: AppColors.orange,
              textColor: AppColors.orange,
              textWeight: FontWeight.w700,
              iconHeight: AppSizes.h18,
              iconWidth: AppSizes.w18,
              textSize: 12,
            ),
          ],
        ),
      ],
    );
  }
}
