part of '../../feature_imports.dart';

class DeliveryRequestCardHeader extends StatelessWidget {
  const DeliveryRequestCardHeader({
    super.key,
    required this.orderNumber,
    required this.date,
    required this.isDeliveryOrder,
    required this.status,
    required this.financialStatus,
  });

  final String orderNumber;
  final String date;
  final bool isDeliveryOrder;
  final StatusModel status;
  final StatusModel financialStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.w14),
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

          Column(
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

          const Spacer(),

          IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                StatusBadge(
                  label: status.name ?? '',
                  color: mapStatus(status).color,
                ),
                verticalSpace(AppSizes.h6),
                StatusBadge(
                  label: financialStatus.name ?? '',
                  color: getStatusColor(financialStatus.color),
                  iconPath: AppAssets.svgHand,
                  height: AppSizes.h16,
                  width: AppSizes.w16,
                ),
              ],
            ),
          ),

          // Order info column
        ],
      ),
    );
  }
}
