part of '../../feature_imports.dart';

class PurchaseOrderDetailsViewBody extends StatelessWidget {
  const PurchaseOrderDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const PurchaseOrderDetailsInfoCard(
            orderNumber: '8274875EDFCHVGJB',
            status: 'under_review',
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
                value: '8274875EDFCHVGJB',
                valueColor: AppColors.darkText,
              ),
              PurchaseOrderDetailsInfoRowData(
                label: LocaleKeys.purchase_order_details_order_value.tr(),
                value: '\$2098',
              ),
              PurchaseOrderDetailsInfoRowData(
                label: LocaleKeys.purchase_order_details_order_status.tr(),
                value: LocaleKeys.purchase_orders_under_review.tr(),
              ),
              PurchaseOrderDetailsInfoRowData(
                label: LocaleKeys.purchase_order_details_creation_date.tr(),
                value: 'م 05:01 2026-01-29',
              ),
              PurchaseOrderDetailsInfoRowData(
                label: LocaleKeys.purchase_order_details_purchase_date.tr(),
                value: 'م 05:01 2026-01-29',
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
