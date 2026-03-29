part of '../../feature_imports.dart';

class PurchaseOrderDetailsInfoCard extends StatelessWidget {
  const PurchaseOrderDetailsInfoCard({
    super.key,
    required this.orderNumber,
    required this.status,
  });

  final String orderNumber;
  final StatusModel? status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.w14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
      child: Row(
        children: [
          CustomIconRoundedBox(
            iconPath: AppAssets.svgBasket,
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
                  LocaleKeys.purchase_orders_order_number.tr(),
                  style: AppTextStyleFactory.create(
                    size: 10,
                    weight: FontWeight.bold,
                    color: AppColors.deepViolet,
                  ),
                ),
                verticalSpace(AppSizes.h4),
                Text(
                  orderNumber,
                  style: AppTextStyleFactory.create(
                    size: 14,
                    weight: FontWeight.w700,
                    color: AppColors.darkSlate,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          horizontalSpace(AppSizes.w8),
          StatusBadge(
            label: status?.name ?? '',
            color: mapPurchaseStatus(status).color,
          ),
        ],
      ),
    );
  }
}
