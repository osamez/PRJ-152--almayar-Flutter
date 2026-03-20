part of '../../feature_imports.dart';

class TicketDetailsInfoSection extends StatelessWidget {
  final TicketModel? ticket;
  const TicketDetailsInfoSection({super.key, this.ticket});

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
            value: '#${ticket?.ticketNumber ?? ""}',
          ),
          Divider(color: AppColors.grey98, height: AppSizes.h24, thickness: 1),
          TicketDetailsInfoRow(
            label: LocaleKeys.ticket_details_creation_date.tr(),
            value: _formatDateTime(ticket?.createdAt),
          ),
          Divider(color: AppColors.grey98, height: AppSizes.h24, thickness: 1),
          TicketDetailsInfoRow(
            label: LocaleKeys.ticket_details_last_reply_date.tr(),
            value: _formatDateTime(ticket?.updatedAt),
          ),
          Divider(color: AppColors.grey98, height: AppSizes.h24, thickness: 1),
          TicketDetailsInfoRow(
            label: LocaleKeys.ticket_details_related_to.tr(),
            value: ticket?.shipmentCode ?? '',
          ),
        ],
      ),
    );
  }

  String _formatDateTime(String? dateTime) {
    if (dateTime == null || dateTime.isEmpty) return '';
    try {
      final date = DateTime.parse(dateTime);
      final day = date.day.toString().padLeft(2, '0');
      final month = date.month.toString().padLeft(2, '0');
      final year = date.year;

      final hour24 = date.hour;
      final hour12 = hour24 > 12 ? hour24 - 12 : (hour24 == 0 ? 12 : hour24);
      final minute = date.minute.toString().padLeft(2, '0');
      final period = hour24 >= 12 ? 'م' : 'ص';

      return '$day-$month-$year $hour12:$minute$period';
    } catch (e) {
      return dateTime;
    }
  }
}
