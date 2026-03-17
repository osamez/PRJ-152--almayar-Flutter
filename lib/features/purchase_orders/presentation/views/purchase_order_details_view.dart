part of '../feature_imports.dart';

class PurchaseOrderDetailsView extends StatelessWidget {
  const PurchaseOrderDetailsView({super.key, required this.order});
  final PurchaseOrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: order.code ?? ''),
      backgroundColor: AppColors.offWhite,
      body: const PurchaseOrderDetailsViewBody().withPadding(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h24,
      ),
    );
  }
}
