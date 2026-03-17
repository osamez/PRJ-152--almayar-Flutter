part of '../../feature_imports.dart';

class PurchaseOrderDetailsViewBody extends StatelessWidget {
  const PurchaseOrderDetailsViewBody({super.key, required this.order});
  final PurchaseOrderModel order;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PurchaseOrderDetailsInfoCard(
            orderNumber: order.code ?? '',
            status: order.status!,
          ),
          verticalSpace(AppSizes.h24),
          PurchaseOrderDetailsSectionTitle(
            title: LocaleKeys.purchase_order_details_basic_info.tr(),
          ),
          verticalSpace(AppSizes.h16),
          PurchaseOrderDetailsInfoSection(
            rows: [
              PurchaseOrderDetailsInfoRowData(
                label: LocaleKeys.purchase_order_details_order_number.tr(),
                value: order.code ?? '-',
                valueColor: AppColors.darkText,
              ),
              PurchaseOrderDetailsInfoRowData(
                label: LocaleKeys.purchase_order_details_order_value.tr(),
                value: '\$${order.orderValue ?? 0}',
              ),
              PurchaseOrderDetailsInfoRowData(
                label: LocaleKeys.purchase_order_details_order_status.tr(),
                value: order.status!.name ?? '',
              ),
              PurchaseOrderDetailsInfoRowData(
                label: LocaleKeys.purchase_order_details_creation_date.tr(),
                value: order.createdAt ?? '-',
              ),
              PurchaseOrderDetailsInfoRowData(
                label: LocaleKeys.purchase_order_details_purchase_date.tr(),
                value: order.purchaseDate ?? '-',
              ),
            ],
          ),
          verticalSpace(AppSizes.h24),
          PurchaseOrderDetailsSectionTitle(
            title: LocaleKeys.purchase_order_details_payment_proof.tr(),
          ),
          verticalSpace(AppSizes.h16),
          const MediaGrid(
            items: [
              // MediaItem(fileName: 'Box_Image.jpg', isImage: true),
              MediaItem(fileName: 'Invoice.pdf', isImage: false),
            ],
          ),
        ],
      ),
    );
  }
}
