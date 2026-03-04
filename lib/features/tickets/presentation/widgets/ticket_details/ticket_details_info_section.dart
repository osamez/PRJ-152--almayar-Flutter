part of '../../feature_imports.dart';

class TicketDetailsInfoSection extends StatelessWidget {
  const TicketDetailsInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow1.withValues(alpha: 0.8),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          TicketDetailsInfoRow(
            label: LocaleKeys.ticket_details_ticket_number.tr(),
            value: '#12345',
          ),
          Divider(color: AppColors.grey98, height: AppSizes.h24, thickness: 1),
          TicketDetailsInfoRow(
            label: LocaleKeys.ticket_details_creation_date.tr(),
            value: '22-10-2026 1:55 م',
          ),
          Divider(color: AppColors.grey98, height: AppSizes.h24, thickness: 1),
          TicketDetailsInfoRow(
            label: LocaleKeys.ticket_details_last_reply_date.tr(),
            value: '1:55 22-10-2026م',
          ),
          Divider(color: AppColors.grey98, height: AppSizes.h24, thickness: 1),
          TicketDetailsInfoRow(
            label: LocaleKeys.ticket_details_related_to.tr(),
            value: 'SEA-888-TIP-F-4852-GU',
          ),
        ],
      ),
    );
  }
}
