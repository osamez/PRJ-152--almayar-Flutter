part of '../../feature_imports.dart';

class PurchaseOrderCard extends StatelessWidget {
  const PurchaseOrderCard({
    super.key,
    required this.order,
    required this.onTap,
  });

  final PurchaseOrderModel order;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: Container(
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
        child: CustomInkWellWidget(
          onTap: () {
            context.pushNamed(Routes.purchaseOrderDetails);
          },
          radius: AppSizes.radiusMd,
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w15,
            vertical: AppSizes.h16,
          ),
          child: Column(
            children: [
              PurchaseOrderCardHeader(
                orderNumber: order.code ?? '',
                status: order.status,
              ),
              verticalSpace(AppSizes.h12),
              PurchaseOrderInfoSection(
                creationDate: order.createdAt ?? '',
                purchaseDate: order.purchaseDate ?? '',
              ),
              const Divider(height: 1, color: Color(0xffF3F4F6)),
              PurchaseOrderStatsSection(
                orderValue: order.orderValue?.toString() ?? '',
                amountPaid: order.paidAmount?.toString() ?? '',
                website: order.shoppingSite?.name ?? '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
