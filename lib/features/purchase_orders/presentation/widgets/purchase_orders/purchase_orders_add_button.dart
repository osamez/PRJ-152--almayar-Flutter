part of '../../feature_imports.dart';

class PurchaseOrdersAddButton extends StatelessWidget {
  const PurchaseOrdersAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.purchase_orders_add_order.tr(),
      onPressed: () => context.push(Routes.addPurchaseOrder),
      backgroundColor: AppColors.orange,
      iconPath: AppAssets.svgAdd,
      iconHeight: AppSizes.h24,
      iconWidth: AppSizes.w24,
    );
  }
}
