part of '../feature_imports.dart';

class AddNewTicketView extends StatelessWidget {
  const AddNewTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.support_tickets_title.tr()),
      body: const AddNewTicketViewBody().withPadding(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h24,
      ),
    );
  }
}
