part of '../../feature_imports.dart';

class AddPurchaseOrderPaymentLinkField extends StatelessWidget {
  const AddPurchaseOrderPaymentLinkField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      isRequired: false,
      hintText: LocaleKeys.add_purchase_order_payment_link_hint.tr(),
      title: LocaleKeys.add_purchase_order_payment_link.tr(),
      titleColor: AppColors.darkText,
      validator: (value) {},
      keyboardType: TextInputType.url,
    );
  }
}
