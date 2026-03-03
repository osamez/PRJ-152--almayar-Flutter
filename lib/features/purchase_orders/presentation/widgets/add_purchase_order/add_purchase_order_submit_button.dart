part of '../../feature_imports.dart';

class AddPurchaseOrderSubmitButton extends StatelessWidget {
  const AddPurchaseOrderSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.add_purchase_order_submit.tr(),
      onPressed: () {},
      backgroundColor: AppColors.orange,
    );
  }
}
