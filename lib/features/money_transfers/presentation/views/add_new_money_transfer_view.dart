part of '../feature_imports.dart';

class AddNewMoneyTransferView extends StatelessWidget {
  const AddNewMoneyTransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.add_money_transfer_heading.tr()),
      body: const AddNewMoneyTransferViewBody().withPadding(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h24,
      ),
    );
  }
}
