part of '../../feature_imports.dart';

class DeliveryRequestCard extends StatelessWidget {
  const DeliveryRequestCard({
    super.key,
    required this.orderNumber,
    required this.date,
    required this.isDeliveryOrder,
    required this.isCompleted,
    required this.isPaid,
    required this.address,
    required this.branch,
    required this.deliveryDate,
    required this.boxesCount,
    required this.orderValue,
    required this.deliveryCost,
    required this.onTap,
  });

  final String orderNumber;
  final String date;
  final bool isDeliveryOrder;
  final bool isCompleted;
  final bool isPaid;
  final String address;
  final String branch;
  final String deliveryDate;
  final String boxesCount;
  final String orderValue;
  final String deliveryCost;
  final VoidCallback onTap;

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
      child: CustomInkWellWidget(
        onTap: onTap,
        radius: AppSizes.radiusMd,
        child: Column(
          children: [
            DeliveryRequestCardHeader(
              orderNumber: orderNumber,
              date: date,
              isDeliveryOrder: isDeliveryOrder,
              isCompleted: isCompleted,
              isPaid: isPaid,
            ),
            Divider(height: 1, color: AppColors.gray.withValues(alpha: 0.5)),
            DeliveryRequestInfoSection(
              address: address,
              branch: branch,
              deliveryDate: deliveryDate,
            ),
            Divider(height: 1, color: AppColors.gray.withValues(alpha: 0.5)),
            DeliveryRequestStatsSection(
              boxesCount: boxesCount,
              orderValue: orderValue,
              deliveryCost: deliveryCost,
            ),
          ],
        ),
      ),
    );
  }
}
