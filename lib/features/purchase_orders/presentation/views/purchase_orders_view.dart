part of '../feature_imports.dart';

class PurchaseOrdersView extends StatelessWidget {
  const PurchaseOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PurchaseOrdersCubit>()..getPurchaseRequests(),
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.purchase_orders_title.tr()),
        backgroundColor: AppColors.offWhite,
        body: const PurchaseOrdersViewBody().withPadding(
          horizontal: AppSizes.w20,
          vertical: AppSizes.h24,
        ),
      ),
    );
  }
}
