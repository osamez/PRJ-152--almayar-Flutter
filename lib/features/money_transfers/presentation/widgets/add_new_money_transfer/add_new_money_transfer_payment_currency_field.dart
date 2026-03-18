part of '../../feature_imports.dart';

class AddNewMoneyTransferPaymentCurrencyField extends StatelessWidget {
  const AddNewMoneyTransferPaymentCurrencyField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewMoneyTransferCubit, AddNewMoneyTransferState>(
      buildWhen: (previous, current) =>
          previous.currencies != current.currencies ||
          previous.selectedPaymentCurrency != current.selectedPaymentCurrency,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  LocaleKeys.add_money_transfer_payment_currency.tr(),
                  style: AppTextStyleFactory.create(
                    size: 13,
                    weight: FontWeight.w500,
                    color: AppColors.darkText,
                  ),
                ),
                horizontalSpace(AppSizes.w4),
                Text(
                  '*',
                  style: AppTextStyleFactory.create(
                    size: 10,
                    weight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            verticalSpace(AppSizes.h8),
            CustomDropdownSearchList<MoneyTransferCurrencyModel>(
              items: state.currencies,
              initialValue: state.selectedPaymentCurrency,
              onChanged: context
                  .read<AddNewMoneyTransferCubit>()
                  .selectPaymentCurrency,
              itemAsString: (item) => item.name ?? item.code ?? '',
              hintText: LocaleKeys.add_money_transfer_payment_currency_hint
                  .tr(),
              showSearch: true,
              validator: (value) {
                if (value == null) {
                  return LocaleKeys.add_money_transfer_payment_currency_hint
                      .tr();
                }
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
