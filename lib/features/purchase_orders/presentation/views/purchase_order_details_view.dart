part of '../feature_imports.dart';

class PurchaseOrderDetailsView extends StatelessWidget {
  const PurchaseOrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'RH2053'),
      backgroundColor: AppColors.offWhite,
      body: const PurchaseOrderDetailsViewBody().withPadding(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h24,
      ),
    );
  }
}
