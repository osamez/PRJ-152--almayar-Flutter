part of '../feature_imports.dart';

class AccountStatementView extends StatelessWidget {
  const AccountStatementView({super.key, required this.wallet});

  final WalletModel wallet;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WalletsCubit>()..getWalletTransactions(wallet.id ?? 0),
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: CustomAppBar(title: LocaleKeys.account_statement_title.tr()),
        body: AccountStatementViewBody(wallet: wallet).withPadding(
          vertical: AppSizes.h24,
          horizontal: AppSizes.w20,
        ),
      ),
    );
  }
}
