part of '../../feature_imports.dart';

class TicketDetailsHeader extends StatelessWidget {
  final TicketModel? ticket;
  const TicketDetailsHeader({super.key, this.ticket});

  @override
  Widget build(BuildContext context) {
    if (ticket == null) return const SizedBox.shrink();

    return SupportTicketCard(
      ticketId: ticket!.id ?? 0,
      title: ticket!.title ??
          LocaleKeys.support_tickets_very_late_shipment.tr(),
      date: ticket!.createdAt ?? '',
      referenceCode: ticket!.shipmentCode ??
          (ticket!.ticketNumber?.toString() ?? ''),
      statusLabel: ticket!.status?.name ??
          LocaleKeys.support_tickets_status_open.tr(),
      statusColor: ticket!.status?.colorValue ?? AppColors.orange,
      priorityLabel: ticket!.priority?.name ??
          LocaleKeys.support_tickets_priority_high.tr(),
      priorityColor: ticket!.priority?.colorValue ?? AppColors.orange,
    );
  }
}
