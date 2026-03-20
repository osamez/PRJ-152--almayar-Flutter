part of '../feature_imports.dart';

class SupportTicketsView extends StatelessWidget {
  const SupportTicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TicketsCubit>()..getAllTickets(),
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: CustomAppBar(title: LocaleKeys.support_tickets_title.tr()),
        body: const SupportTicketsViewBody().withPadding(
          horizontal: AppSizes.w20,
          vertical: AppSizes.h24,
        ),
      ),
    );
  }
}
