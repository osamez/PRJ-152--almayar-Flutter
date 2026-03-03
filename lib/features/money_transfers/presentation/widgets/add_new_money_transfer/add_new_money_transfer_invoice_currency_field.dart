part of '../../feature_imports.dart';

class AddNewMoneyTransferInvoiceCurrencyField extends StatelessWidget {
  const AddNewMoneyTransferInvoiceCurrencyField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      isRequired: false,
      hintText: LocaleKeys.add_money_transfer_invoice_currency_hint.tr(),
      title: LocaleKeys.add_money_transfer_invoice_currency.tr(),
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
