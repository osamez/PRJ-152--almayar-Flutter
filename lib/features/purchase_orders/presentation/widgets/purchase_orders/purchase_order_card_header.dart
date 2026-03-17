part of '../../feature_imports.dart';

class PurchaseOrderCardHeader extends StatelessWidget {
  const PurchaseOrderCardHeader({
    super.key,
    required this.orderNumber,
    required this.status,
  });

  final String orderNumber;
  final StatusModel? status;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconRoundedBox(
          iconPath: AppAssets.svgBasket,
          width: AppSizes.w48,
          height: AppSizes.h48,

          iconColor: AppColors.yellow,
          backgroundColor: const Color(0xffF9C74F).withValues(alpha: 0.16),
        ),

        horizontalSpace(AppSizes.w16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.purchase_orders_order_number.tr(),
              style: AppTextStyleFactory.create(
                size: 10,
                weight: FontWeight.w700,
                color: AppColors.deepViolet,
              ),
            ),
            verticalSpace(AppSizes.h4),
            Text(
              orderNumber,
              style: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.darkSlate,
              ),
            ),
          ],
        ),

        const Spacer(),
        PurchaseOrderStatusBadge(status: status),
      ],
    );
  }
}
