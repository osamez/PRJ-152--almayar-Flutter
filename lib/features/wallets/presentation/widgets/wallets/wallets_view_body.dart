part of '../../feature_imports.dart';

class WalletsViewBody extends StatelessWidget {
  const WalletsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        WalletCard(
          walletName: LocaleKeys.wallets_libyan_dinar.tr(),
          balance: LocaleKeys.wallets_current_balance.tr(
            namedArgs: {
              'balance': '0',
              'currency': LocaleKeys.wallets_currency_lyd.tr(),
            },
          ),
        ),
        verticalSpace(AppSizes.h16),
        WalletCard(
          walletName: LocaleKeys.wallets_us_dollar.tr(),
          balance: LocaleKeys.wallets_current_balance.tr(
            namedArgs: {
              'balance': '0',
              'currency': LocaleKeys.wallets_currency_usd.tr(),
            },
          ),
        ),
        verticalSpace(AppSizes.h16),
        WalletCard(
          walletName: LocaleKeys.wallets_turkish_lira.tr(),
          balance: LocaleKeys.wallets_current_balance.tr(
            namedArgs: {
              'balance': '0',
              'currency': LocaleKeys.wallets_currency_try.tr(),
            },
          ),
        ),
      ],
    );
  }
}
