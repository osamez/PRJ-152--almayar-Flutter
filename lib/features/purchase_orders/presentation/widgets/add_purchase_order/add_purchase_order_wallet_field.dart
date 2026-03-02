part of '../../feature_imports.dart';

class AddPurchaseOrderWalletField extends StatelessWidget {
  const AddPurchaseOrderWalletField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      isRequired: false,
      hintText: LocaleKeys.add_purchase_order_payment_wallet_hint.tr(),
      title: LocaleKeys.add_purchase_order_payment_wallet.tr(),
      titleColor: AppColors.darkText,
      readOnly: true,
      validator: (value) {},
      suffixIcon: Icon(
        Icons.keyboard_arrow_down_rounded,
        size: AppSizes.w24,
        color: AppColors.hintColor,
      ),
    );
  }
}
