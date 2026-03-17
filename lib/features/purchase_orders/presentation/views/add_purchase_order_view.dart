part of '../feature_imports.dart';

class AddPurchaseOrderView extends StatelessWidget {
  const AddPurchaseOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddPurchaseOrderCubit>()..initAdditionData(),
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.add_purchase_order_title.tr()),
        backgroundColor: AppColors.offWhite,
        body: const AddPurchaseOrderViewBody().withPadding(
          horizontal: AppSizes.w20,
          vertical: AppSizes.h24,
        ),
      ),
    );
  }
}
