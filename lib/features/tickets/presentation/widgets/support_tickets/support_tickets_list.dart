part of '../../feature_imports.dart';

class SupportTicketsList extends StatefulWidget {
  const SupportTicketsList({
    super.key,
    required this.tickets,
    required this.hasMore,
    required this.isLoading,
    required this.isPaginationLoading,
  });

  final List<TicketModel> tickets;
  final bool hasMore;
  final bool isLoading;
  final bool isPaginationLoading;

  @override
  State<SupportTicketsList> createState() => _SupportTicketsListState();
}

class _SupportTicketsListState extends State<SupportTicketsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      context.read<TicketsCubit>().loadMoreTickets();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      itemCount:
          widget.tickets.length + (widget.hasMore && !widget.isLoading ? 1 : 0),
      separatorBuilder: (context, index) => verticalSpace(AppSizes.h12),
      itemBuilder: (context, index) {
        if (index < widget.tickets.length) {
          final ticket = widget.tickets[index];
          final statusLabel =
              ticket.status?.name ??
              LocaleKeys.support_tickets_status_open.tr();
          final priorityLabel =
              ticket.priority?.name ??
              LocaleKeys.support_tickets_priority_high.tr();

          return SupportTicketCard(
            ticketId: ticket.id ?? 0,
            title:
                ticket.title ??
                LocaleKeys.support_tickets_very_late_shipment.tr(),
            date: ticket.createdAt ?? '',
            referenceCode:
                ticket.shipmentCode ?? (ticket.ticketNumber?.toString() ?? ''),
            statusLabel: statusLabel,
            statusColor: _statusColor(ticket),
            priorityLabel: priorityLabel,
            priorityColor: _priorityColor(ticket),
          );
        }

        if (!widget.isPaginationLoading) {
          return const SizedBox.shrink();
        }

        return const Center(
          child: CircularProgressIndicator(),
        ).withPadding(vertical: AppSizes.h10);
      },
    );
  }

  Color _statusColor(TicketModel ticket) {
    final apiColor = _resolveApiColor(ticket.status?.color);
    if (apiColor != null) return apiColor;

    switch (ticket.status?.id) {
      case 3:
        return AppColors.green;
      case 4:
        return AppColors.yellow;
      case 5:
        return AppColors.gray;
      default:
        return AppColors.orange;
    }
  }

  Color _priorityColor(TicketModel ticket) {
    final apiColor = _resolveApiColor(ticket.priority?.color);
    if (apiColor != null) return apiColor;
    return AppColors.orange;
  }

  Color? _resolveApiColor(String? raw) {
    final token = raw?.trim().toLowerCase();
    switch (token) {
      case 'primary':
        return AppColors.orange;
      case 'success':
        return AppColors.green;
      case 'danger':
      case 'error':
        return AppColors.error500;
      default:
        return null;
    }
  }
}
