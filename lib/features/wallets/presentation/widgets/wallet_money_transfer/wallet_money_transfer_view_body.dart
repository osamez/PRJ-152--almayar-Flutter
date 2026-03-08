part of '../../feature_imports.dart';

class WalletMoneyTransferViewBody extends StatelessWidget {
  const WalletMoneyTransferViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const WalletBanner(
            walletName: LocaleKeys.wallets_libyan_dinar,
            balance: '0',
            currencyKey: LocaleKeys.wallets_currency_lyd,
          ),
          verticalSpace(AppSizes.h24),
          AppTextFormField(
            isRequired: false,
            hintText: LocaleKeys.wallet_money_transfer_customer_code_hint.tr(),
            title: LocaleKeys.wallet_money_transfer_customer_code.tr(),
            titleColor: AppColors.darkText,
            validator: (value) {},
            keyboardType: TextInputType.text,
          ),
          verticalSpace(AppSizes.h16),
          AppTextFormField(
            isRequired: false,
            hintText: LocaleKeys.wallet_money_transfer_amount_hint.tr(),
            title: LocaleKeys.wallet_money_transfer_amount.tr(),
            titleColor: AppColors.darkText,
            validator: (value) {},
            keyboardType: TextInputType.number,
          ),
          verticalSpace(AppSizes.h16),
          const WalletMoneyTransferSummaryCard(),
          verticalSpace(AppSizes.h32),

          const WalletMoneyTransferSubmitButton(),
        ],
      ),
    );
  }
}
