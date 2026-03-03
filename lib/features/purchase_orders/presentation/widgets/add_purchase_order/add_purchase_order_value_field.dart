part of '../../feature_imports.dart';

class AddPurchaseOrderValueField extends StatelessWidget {
  const AddPurchaseOrderValueField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      isRequired: false,
      hintText: LocaleKeys.add_purchase_order_value_in_dollars_hint.tr(),
      title: LocaleKeys.add_purchase_order_value_in_dollars.tr(),
      titleColor: AppColors.darkText,
      validator: (value) {},
      keyboardType: TextInputType.number,
    );
  }
}
