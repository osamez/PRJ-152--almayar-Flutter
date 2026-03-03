part of '../../feature_imports.dart';

class PurchaseOrderInfoSection extends StatelessWidget {
  const PurchaseOrderInfoSection({
    super.key,
    required this.creationDate,
    required this.purchaseDate,
  });

  final String creationDate;
  final String purchaseDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PurchaseOrderInfoRow(
          icon: AppAssets.svgCalendar,
          label: LocaleKeys.purchase_orders_creation_date.tr(),
          value: creationDate,
        ),
        verticalSpace(AppSizes.h8),
        const Divider(height: 1, color: Color(0xffF3F4F6)),
        verticalSpace(AppSizes.h8),

        PurchaseOrderInfoRow(
          icon: AppAssets.svgCalendar,
          label: LocaleKeys.purchase_orders_purchase_date.tr(),
          value: purchaseDate,
        ),
        verticalSpace(AppSizes.h8),
      ],
    );
  }
}
