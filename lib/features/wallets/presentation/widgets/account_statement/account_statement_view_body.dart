part of '../../feature_imports.dart';

class AccountStatementViewBody extends StatelessWidget {
  const AccountStatementViewBody({super.key, required this.wallet});

  final WalletModel wallet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WalletBanner(
          walletName: wallet.walletName ?? '',
          balance: wallet.amount?.toString() ?? '0',
          currencyKey: wallet.currencyName ?? '',
        ),
        verticalSpace(AppSizes.h20),
        const AccountStatementActionButtonsRow(),
        verticalSpace(AppSizes.h24),
        AccountStatementFilterHeader(walletId: wallet.id ?? 0),
        verticalSpace(AppSizes.h16),
        Expanded(
          child: BlocBuilder<WalletsCubit, WalletsState>(
            buildWhen: (previous, current) =>
                previous.getWalletTransactionsState !=
                current.getWalletTransactionsState,
            builder: (context, state) {
              return state.getWalletTransactionsState.when(
                initial: () => const SizedBox.shrink(),
                loading: () => _buildTransactionsList(null, isLoading: true),
                data: (transactions) => _buildTransactionsList(transactions),
                error: (failure) {
                  if (failure.status == LocalStatusCodes.connectionError) {
                    return InternetConnectionWidget(
                      onPressed: () => context
                          .read<WalletsCubit>()
                          .getWalletTransactions(wallet.id ?? 0),
                    );
                  }
                  return CustomErrorWidget(
                    message: failure.error,
                    onPressed: () => context
                        .read<WalletsCubit>()
                        .getWalletTransactions(wallet.id ?? 0),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionsList(
    List<WalletTransactionModel>? transactions, {
    bool isLoading = false,
  }) {
    if (!isLoading && (transactions == null || transactions.isEmpty)) {
      return Center(
        child: Text(
          LocaleKeys.no_data.tr(),
          style: AppTextStyleFactory.create(
            size: 14,
            weight: FontWeight.w400,
            color: AppColors.hintColor,
          ),
        ),
      );
    }

    return Skeletonizer(
      enabled: isLoading,
      child: ListView.separated(
        padding: const EdgeInsets.all(2),
        itemCount: isLoading ? 5 : transactions!.length,
        separatorBuilder: (context, index) => verticalSpace(AppSizes.h16),
        itemBuilder: (context, index) {
          if (isLoading) {
            return AccountStatementTransactionCard(
              type: TransactionType.collection,
              amount: '1000',
              currencyKey: LocaleKeys.wallets_currency_lyd,
              date: '2026-01-01',
              description: 'Description' * 5,
              balanceAfter: 'Balance',
            );
          }

          final transaction = transactions![index];
          return AccountStatementTransactionCard(
            type: _mapTypeIdToTransactionType(transaction.typeId),
            amount: transaction.amount?.toString() ?? '0',
            currencyKey: wallet.currencyName ?? '',
            date: transaction.createdAt ?? '',
            description: transaction.notes ?? '',
            balanceAfter: LocaleKeys.account_statement_balance_after.tr(
              namedArgs: {
                'balance': transaction.balanceAfter?.toString() ?? '0',
                'currency': (wallet.currencyName ?? '').tr(),
              },
            ),
          );
        },
      ),
    );
  }

  TransactionType _mapTypeIdToTransactionType(int? typeId) {
    // 1: Receipt (قبض), 3: Deposit (إيداع), 5: Benefit Deposit (إيداع إستحقاق) -> collection
    // 2: Disbursement (صرف), 4: Withdraw (سحب), 6: Withdrawal Entitlement (سحب إستحقاق) -> disbursement
    if (typeId == 1 || typeId == 3 || typeId == 5) {
      return TransactionType.collection;
    }
    return TransactionType.disbursement;
  }
}
