part of '../../feature_imports.dart';

class WalletsViewBody extends StatelessWidget {
  const WalletsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletsCubit, WalletsState>(
      builder: (context, state) {
        return state.getMyWalletsState.when(
          loading: () => _buildContent(context, isLoading: true),
          error: (failure) {
            if (failure.status == LocalStatusCodes.connectionError) {
              return InternetConnectionWidget(
                onPressed: () => context.read<WalletsCubit>().getMyWallets(),
              ).center;
            }
            return CustomErrorWidget(
              message: failure.error,
              onPressed: () => context.read<WalletsCubit>().getMyWallets(),
            ).center;
          },
          initial: () => const SizedBox.shrink(),
          data: (wallets) {
            if (wallets.isEmpty) {
              return EmptyWidget(
                message: LocaleKeys.no_data.tr(),
                imagePath: AppAssets.animationsEmpty,
              ).center;
            }
            return _buildContent(context, wallets: wallets);
          },
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context, {
    List<WalletModel>? wallets,
    bool isLoading = false,
  }) {
    final displayWallets = isLoading
        ? [
            const WalletModel(walletName: 'Libyan Dinar', amount: 0),
            const WalletModel(walletName: 'US Dollar', amount: 0),
            const WalletModel(walletName: 'Turkish Lira', amount: 0),
          ]
        : wallets!;

    return Skeletonizer(
      enabled: isLoading,
      child: RefreshIndicator(
        onRefresh: () async {
          await context.read<WalletsCubit>().getMyWallets();
        },
        child: ListView.separated(
          itemCount: displayWallets.length,
          separatorBuilder: (context, index) => verticalSpace(AppSizes.h16),
          itemBuilder: (context, index) {
            final wallet = displayWallets[index];
            return WalletCard(
              onTap: () {
                context.pushNamed(Routes.accountStatement, extra: wallet);
              },
              walletName: wallet.walletName ?? '',
              balance: LocaleKeys.wallets_current_balance.tr(
                namedArgs: {
                  'balance': wallet.amount?.toString() ?? '0',
                  'currency': wallet.currencyName ?? '',
                },
              ),
            );
          },
        ),
      ),
    );
  }

  // String _getWalletName(WalletModel wallet) {
  //   if (wallet.walletName?.toLowerCase().contains('lyd') ?? false) {
  //     return LocaleKeys.wallets_libyan_dinar.tr();
  //   }
  //   if (wallet.walletName?.toLowerCase().contains('usd') ?? false) {
  //     return LocaleKeys.wallets_us_dollar.tr();
  //   }
  //   if (wallet.walletName?.toLowerCase().contains('try') ?? false) {
  //     return LocaleKeys.wallets_turkish_lira.tr();
  //   }
  //   return wallet.walletName ?? '';
  // }

  // String _getCurrencyName(WalletModel wallet) {
  //   if (wallet.walletName?.toLowerCase().contains('lyd') ?? false) {
  //     return LocaleKeys.wallets_currency_lyd.tr();
  //   }
  //   if (wallet.walletName?.toLowerCase().contains('usd') ?? false) {
  //     return LocaleKeys.wallets_currency_usd.tr();
  //   }
  //   if (wallet.walletName?.toLowerCase().contains('try') ?? false) {
  //     return LocaleKeys.wallets_currency_try.tr();
  //   }
  //   return '';
  // }
}
