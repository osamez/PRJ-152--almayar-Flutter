part of '../../feature_imports.dart';

class DetailsHeaderCard extends StatelessWidget {
  const DetailsHeaderCard({
    super.key,
    required this.shipmentCode,
    required this.status,
    required this.originWarehouse,
    required this.originCountry,
    required this.destinationWarehouse,
    required this.destinationCountry,
    required this.date,
    required this.shippingType,
  });

  final String shipmentCode;
  final PickupRequestStatus status;
  final String originWarehouse;
  final String originCountry;
  final String destinationWarehouse;
  final String destinationCountry;
  final String date;
  final String shippingType;

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
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w16,
              vertical: AppSizes.h16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shipmentCode,
                      style: AppTextStyleFactory.create(
                        size: 24,
                        weight: FontWeight.w700,
                        color: AppColors.deepViolet,
                      ),
                    ),
                    verticalSpace(AppSizes.h4),
                    Text(
                      LocaleKeys.shipment_details_order_code.tr(),
                      style: AppTextStyleFactory.create(
                        size: 12,
                        weight: FontWeight.w400,
                        color: AppColors.hintColor,
                      ),
                    ),
                  ],
                ),
                PickupRequestStatusBadge(status: status),
              ],
            ),
          ),
          PickupRequestRouteSection(
            originWarehouse: originWarehouse,
            originCountry: originCountry,
            destinationWarehouse: destinationWarehouse,
            destinationCountry: destinationCountry,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w16,
              vertical: AppSizes.h12,
            ),
            child: Row(
              children: [
                _DateShippingChip(
                  iconPath: AppAssets.svgCalendar,
                  label: 'تاريخ الطلب',
                  value: date,
                ),
                const Spacer(),

                _DateShippingChip(
                  iconPath: AppAssets.svgBoat,
                  label: LocaleKeys.shipment_details_shipping_type.tr(),
                  value: shippingType,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DateShippingChip extends StatelessWidget {
  const _DateShippingChip({
    required this.iconPath,
    required this.label,
    required this.value,
  });

  final String iconPath;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w12,
        vertical: AppSizes.h8,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey98,
        borderRadius: BorderRadius.circular(AppSizes.radiusXs),
        border: Border.all(color: AppColors.gray.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSizes.w8,
        children: [
          CustomIconRoundedBox(
            iconPath: iconPath,
            radius: 6,
            padding: const EdgeInsets.all(4),
            width: AppSizes.w32,
            height: AppSizes.h32,
            iconHeight: AppSizes.h24,
            iconWidth: AppSizes.w24,
            iconColor: AppColors.deepViolet,
            backgroundColor: AppColors.grey97,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyleFactory.create(
                  size: 10,
                  weight: FontWeight.w600,
                  color: AppColors.hintColor,
                ),
              ),
              Text(
                value,
                style: AppTextStyleFactory.create(
                  size: 12,
                  weight: FontWeight.w700,
                  color: AppColors.deepViolet,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
