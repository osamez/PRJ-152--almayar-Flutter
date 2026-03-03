part of '../feature_imports.dart';

class MoneyTransfersView extends StatelessWidget {
  const MoneyTransfersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.money_transfers_title.tr()),
      body: const MoneyTransfersViewBody().withPadding(
        vertical: AppSizes.h24,
        horizontal: AppSizes.w20,
      ),
    );
  }
}
