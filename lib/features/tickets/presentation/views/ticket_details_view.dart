part of '../feature_imports.dart';

class TicketDetailsView extends StatelessWidget {
  final int ticketId;
  const TicketDetailsView({super.key, required this.ticketId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TicketDetailsCubit>()..getTicketDetails(ticketId),
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: CustomAppBar(title: LocaleKeys.ticket_details_title.tr()),
        body: TicketDetailsViewBody(ticketId: ticketId),
      ),
    );
  }
}
