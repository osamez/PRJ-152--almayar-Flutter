part of '../../feature_imports.dart';

class RequestItemDetailsInfoCard extends StatelessWidget {
  const RequestItemDetailsInfoCard({
    super.key,
    required this.orderNumber,
    required this.date,
    required this.isDeliveryOrder,
    required this.isCompleted,
    required this.isPaid,
  });

  final String orderNumber;
  final String date;
  final bool isDeliveryOrder;
  final bool isCompleted;
  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.w14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomIconRoundedBox(
            iconPath: isDeliveryOrder
                ? AppAssets.svgTruck
                : AppAssets.svgPerson,
            width: AppSizes.w48,
            height: AppSizes.h48,
            backgroundColor: AppColors.grey97,
            iconColor: AppColors.deepViolet,
          ),
          horizontalSpace(AppSizes.w10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderNumber,
                  style: AppTextStyleFactory.create(
                    size: 12,
                    weight: FontWeight.w700,
                    color: AppColors.darkSlate,
                  ),
                ),
                verticalSpace(AppSizes.h4),
                IconTextRow(
                  iconPath: AppAssets.svgCalendar,
                  text: date,
                  textColor: AppColors.deepViolet,
                  iconColor: AppColors.deepViolet,
                  textWeight: FontWeight.w700,
                  iconHeight: AppSizes.h16,
                  iconWidth: AppSizes.w16,
                ),
                verticalSpace(AppSizes.h4),
                IconTextRow(
                  iconPath: isDeliveryOrder
                      ? AppAssets.svgTruck
                      : AppAssets.svgPerson,
                  text: isDeliveryOrder
                      ? LocaleKeys.delivery_requests_delivery_order.tr()
                      : LocaleKeys.delivery_requests_personal_pickup_order.tr(),
                  textColor: AppColors.orange,
                  iconColor: AppColors.orange,
                  textWeight: FontWeight.w700,
                  iconHeight: AppSizes.h16,
                  iconWidth: AppSizes.w16,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DeliveryRequestStatusBadge(
                label: isCompleted
                    ? LocaleKeys.delivery_requests_completed.tr()
                    : LocaleKeys.delivery_requests_delivering.tr(),
                color: isCompleted ? AppColors.green : AppColors.deepViolet,
                iconPath: AppAssets.svgDot,
                iconHeight: AppSizes.h8,
                iconWidth: AppSizes.w8,
              ),
              verticalSpace(AppSizes.h6),
              DeliveryRequestStatusBadge(
                label: isPaid
                    ? LocaleKeys.delivery_requests_paid.tr()
                    : LocaleKeys.delivery_requests_unpaid.tr(),
                color: isPaid ? AppColors.green : AppColors.orange,
                iconPath: AppAssets.svgHand,
                iconHeight: AppSizes.h16,
                iconWidth: AppSizes.w16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
