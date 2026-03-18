part of '../../feature_imports.dart';

class DeliveryRequestCard extends StatelessWidget {
  const DeliveryRequestCard({
    super.key,
    required this.order,
    required this.onTap,
  });

  final DeliveryOrderModel order;
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
          onTap: onTap,
          radius: AppSizes.radiusMd,
          child: Column(
            children: [
              DeliveryRequestCardHeader(
                orderNumber: order.code ?? "",
                date: order.createdAt ?? "",
                isDeliveryOrder: order.type != 'شخصي',
                status: order.status ?? const StatusModel(),
                financialStatus: order.financialStatus ?? const StatusModel(),
              ),
              Divider(height: 1, color: AppColors.gray.withValues(alpha: 0.5)),
              DeliveryRequestInfoSection(
                address: order.address ?? "",
                branch: order.deliveryBranch ?? "",
                deliveryDate: order.deliveryDate ?? "",
              ),
              Divider(height: 1, color: AppColors.gray.withValues(alpha: 0.5)),
              DeliveryRequestStatsSection(
                boxesCount: (order.boxesCount ?? 0).toString(),
                orderValue: '\$${(order.totalPrice ?? 0).toString()}',
                deliveryCost: '\$${(order.deliveryPrice ?? 0).toString()}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
