part of '../../feature_imports.dart';

class AccountStatementViewBody extends StatelessWidget {
  const AccountStatementViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AccountStatementWalletBanner(
          walletName: 'wallets_libyan_dinar',
          balance: '0',
          currencyKey: 'wallets_currency_lyd',
        ),
        verticalSpace(AppSizes.h20),
        const AccountStatementActionButtonsRow(),
        verticalSpace(AppSizes.h24),
        const AccountStatementFilterHeader(resultsCount: 3),
        verticalSpace(AppSizes.h16),
        AccountStatementTransactionCard(
          type: TransactionType.collection,
          amount: '1000',
          currencyKey: LocaleKeys.wallets_currency_lyd,
          date: '2026-01-01',
          description: LocaleKeys.account_statement_deposit_description.tr(
            namedArgs: {'transactionId': '2345657'},
          ),
          balanceAfter: LocaleKeys.account_statement_balance_after.tr(
            namedArgs: {
              'balance': '1000',
              'currency': LocaleKeys.wallets_currency_lyd.tr(),
            },
          ),
        ),
        verticalSpace(AppSizes.h16),
        AccountStatementTransactionCard(
          type: TransactionType.disbursement,
          amount: '1000',
          currencyKey: LocaleKeys.wallets_currency_lyd,
          date: '2026-01-01',
          description: LocaleKeys.account_statement_deduction_description.tr(
            namedArgs: {'orderId': '235654'},
          ),
          balanceAfter: LocaleKeys.account_statement_balance_after.tr(
            namedArgs: {
              'balance': '0',
              'currency': LocaleKeys.wallets_currency_lyd.tr(),
            },
          ),
        ),
      ],
    );
  }
}
