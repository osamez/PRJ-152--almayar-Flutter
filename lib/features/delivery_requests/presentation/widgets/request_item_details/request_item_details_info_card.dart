part of '../../feature_imports.dart';

class RequestItemDetailsInfoCard extends StatelessWidget {
  const RequestItemDetailsInfoCard({super.key, required this.order});
  final DeliveryOrderDetailsModel order;

  @override
  Widget build(BuildContext context) {
    final bool isDeliveryOrder = order.type != 'شخصي';
    return Skeleton.leaf(
      child: Container(
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
                    order.code ?? "",
                    style: AppTextStyleFactory.create(
                      size: 13,
                      weight: FontWeight.w700,
                      color: AppColors.darkSlate,
                    ),
                  ),
                  verticalSpace(AppSizes.h4),
                  IconTextRow(
                    iconPath: AppAssets.svgCalendar,
                    text: order.createdAt != null
                        ? formatDateFromApi(order.createdAt!)
                        : "",
                    textColor: AppColors.deepViolet,
                    iconColor: AppColors.deepViolet,
                    textWeight: FontWeight.w700,
                    iconHeight: AppSizes.h18,
                    iconWidth: AppSizes.w18,
                    textSize: 12,
                  ),
                  verticalSpace(AppSizes.h4),
                  IconTextRow(
                    iconPath: isDeliveryOrder
                        ? AppAssets.svgTruck
                        : AppAssets.svgPerson,
                    text: isDeliveryOrder
                        ? LocaleKeys.delivery_requests_delivery_order.tr()
                        : LocaleKeys.delivery_requests_personal_pickup_order
                              .tr(),
                    textColor: AppColors.orange,
                    iconColor: AppColors.orange,
                    iconHeight: AppSizes.h18,
                    iconWidth: AppSizes.w18,
                    textSize: 12,
                  ),
                ],
              ),
            ),
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  StatusBadge(
                    label: mapStatus(order.status).label,
                    color: mapStatus(order.status).color,
                  ),
                  verticalSpace(AppSizes.h6),
                  StatusBadge(
                    label: order.financialStatus?.name ?? "-",
                    color: getStatusColor(order.financialStatus?.color),
                    iconPath: AppAssets.svgHand,
                    height: AppSizes.h16,
                    width: AppSizes.w16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
