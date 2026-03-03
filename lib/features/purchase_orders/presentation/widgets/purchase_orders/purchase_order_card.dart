part of '../../feature_imports.dart';

class PurchaseOrderCard extends StatelessWidget {
  const PurchaseOrderCard({
    super.key,
    required this.orderNumber,
    required this.creationDate,
    required this.purchaseDate,
    required this.orderValue,
    required this.amountPaid,
    required this.website,
    required this.status,
    required this.onTap,
  });

  final String orderNumber;
  final String creationDate;
  final String purchaseDate;
  final String orderValue;
  final String amountPaid;
  final String website;
  final String status;
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
            PurchaseOrderCardHeader(orderNumber: orderNumber, status: status),
            verticalSpace(AppSizes.h12),
            PurchaseOrderInfoSection(
              creationDate: creationDate,
              purchaseDate: purchaseDate,
            ),
            const Divider(height: 1, color: Color(0xffF3F4F6)),
            PurchaseOrderStatsSection(
              orderValue: orderValue,
              amountPaid: amountPaid,
              website: website,
            ),
          ],
        ),
      ),
    );
  }
}
