part of '../../feature_imports.dart';

class AddPurchaseOrderViewBody extends StatelessWidget {
  const AddPurchaseOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AddPurchaseOrderShoppingSiteField(),
                verticalSpace(AppSizes.h16),
                const AddPurchaseOrderPaymentLinkField(),
                verticalSpace(AppSizes.h16),
                const AddPurchaseOrderValueField(),
                verticalSpace(AppSizes.h16),
                const AddPurchaseOrderWalletField(),
              ],
            ),
          ),
        ),
        verticalSpace(AppSizes.h16),
        const AddPurchaseOrderSubmitButton(),
        verticalSpace(AppSizes.h8),
      ],
    );
  }
}
