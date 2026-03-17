part of '../../feature_imports.dart';

class PurchaseOrdersAddButton extends StatelessWidget {
  const PurchaseOrdersAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.purchase_orders_add_order.tr(),
      onPressed: () async {
        final result = await context.push(Routes.addPurchaseOrder);
        if (result == true) {
          if (!context.mounted) return;
          context.read<PurchaseOrdersCubit>().getPurchaseRequests(
            isRefresh: true,
          );
        }
      },
      backgroundColor: AppColors.orange,
      iconPath: AppAssets.svgAdd,
      iconHeight: AppSizes.h24,
      iconWidth: AppSizes.w24,
    );
  }
}
