part of '../../feature_imports.dart';

class SupportTicketsList extends StatelessWidget {
  const SupportTicketsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (context, index) => verticalSpace(AppSizes.h12),
      itemBuilder: (context, index) {
        return SupportTicketCard(
          title: LocaleKeys.support_tickets_very_late_shipment.tr(),
          date: '2026-01-01',
          referenceCode: 'SEA-888-TIP-F-4852-GU',
          statusLabel: LocaleKeys.support_tickets_status_open.tr(),
          statusColor: AppColors.green,
          priorityLabel: LocaleKeys.support_tickets_priority_high.tr(),
          priorityColor: AppColors.orange,
        );
      },
    );
  }
}
