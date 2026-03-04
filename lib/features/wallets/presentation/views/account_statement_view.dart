part of '../feature_imports.dart';

class AccountStatementView extends StatelessWidget {
  const AccountStatementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.account_statement_title.tr()),
      body: const AccountStatementViewBody().withPadding(
        vertical: AppSizes.h24,
        horizontal: AppSizes.w20,
      ),
    );
  }
}
