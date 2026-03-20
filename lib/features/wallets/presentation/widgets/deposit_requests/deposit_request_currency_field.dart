part of '../../feature_imports.dart';

class DepositRequestCurrencyField extends StatelessWidget {
  const DepositRequestCurrencyField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositRequestsCubit, DepositRequestsState>(
      buildWhen: (prev, curr) =>
          prev.getDepositMetadataState != curr.getDepositMetadataState ||
          prev.selectedCurrency != curr.selectedCurrency,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              LocaleKeys.deposit_requests_currency.tr(),
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            verticalSpace(AppSizes.h8),
            CustomDropdownSearchList<CurrencyModel>(
              items: state.depositCurrencies,
              initialValue: state.selectedCurrency,
              onChanged: context.read<DepositRequestsCubit>().selectCurrency,
              itemAsString: (item) => item.name ?? '',
              hintText: LocaleKeys.deposit_requests_currency_hint.tr(),
              validator: (value) {
                if (value == null) {
                  return LocaleKeys.fieldRequired.tr();
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
