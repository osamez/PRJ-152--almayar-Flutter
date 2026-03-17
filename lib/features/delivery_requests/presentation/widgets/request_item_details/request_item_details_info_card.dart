part of '../../feature_imports.dart';

class RequestItemDetailsInfoCard extends StatelessWidget {
  const RequestItemDetailsInfoCard({super.key, required this.order});
  final DeliveryOrderDetailsModel order;

  @override
  Widget build(BuildContext context) {
    final bool isDeliveryOrder = order.type == 'delivery_service';
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
                      size: 12,
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
                        : LocaleKeys.delivery_requests_personal_pickup_order
                              .tr(),
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
                  label: order.status?.name ?? "",
                  color: AppColors.deepViolet,
                  iconPath: AppAssets.svgDot,
                  iconHeight: AppSizes.h8,
                  iconWidth: AppSizes.w8,
                ),
                verticalSpace(AppSizes.h6),
                DeliveryRequestStatusBadge(
                  label: order.financialStatus?.name ?? "",
                  color: _getStatusColor(order.financialStatus?.color),
                  iconPath: AppAssets.svgHand,
                  iconHeight: AppSizes.h16,
                  iconWidth: AppSizes.w16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String? color) {
    switch (color?.toLowerCase()) {
      case 'success':
        return AppColors.green;
      case 'danger':
        return AppColors.orange;
      case 'warning':
        return AppColors.yellow;
      case 'info':
        return AppColors.lightViolet;
      default:
        return AppColors.deepViolet;
    }
  }
}
