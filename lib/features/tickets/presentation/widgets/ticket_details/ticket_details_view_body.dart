part of '../../feature_imports.dart';

class TicketDetailsViewBody extends StatelessWidget {
  const TicketDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w20,
              vertical: AppSizes.h16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SupportTicketCard(
                  title: LocaleKeys.support_tickets_very_late_shipment.tr(),
                  date: '2026-01-01',
                  referenceCode: 'SEA-888-TIP-F-4852-GU',
                  statusLabel: LocaleKeys.support_tickets_status_open.tr(),
                  statusColor: AppColors.green,
                  priorityLabel: LocaleKeys.support_tickets_priority_high.tr(),
                  priorityColor: AppColors.orange,
                ),
                verticalSpace(AppSizes.h16),
                const TicketDetailsInfoSection(),
                verticalSpace(AppSizes.h24),
                const TicketDetailsDescriptionCard(),
                verticalSpace(AppSizes.h24),
                const TicketDetailsCorrespondenceSection(),
              ],
            ),
          ),
        ),
        const TicketDetailsReplyInput(),
      ],
    );
  }
}
