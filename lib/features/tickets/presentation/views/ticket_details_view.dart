part of '../feature_imports.dart';

class TicketDetailsView extends StatelessWidget {
  const TicketDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.ticket_details_title.tr()),
      body: const TicketDetailsViewBody(),
    );
  }
}
