part of '../../feature_imports.dart';

class SupportTicketsAddButton extends StatelessWidget {
  const SupportTicketsAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: () async {
        final result = await context.push(Routes.addNewTicket);
        if (result == true && context.mounted) {
          context.read<TicketsCubit>().getAllTickets();
        }
      },
      text: LocaleKeys.support_tickets_add_new.tr(),
      backgroundColor: AppColors.orange,
      iconPath: AppAssets.svgAdd,
      iconWidth: AppSizes.w20,
      iconHeight: AppSizes.h20,
    );
  }
}
