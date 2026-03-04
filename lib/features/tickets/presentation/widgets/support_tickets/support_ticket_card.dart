part of '../../feature_imports.dart';

class SupportTicketCard extends StatelessWidget {
  const SupportTicketCard({
    super.key,
    required this.title,
    required this.date,
    required this.referenceCode,
    required this.statusLabel,
    required this.statusColor,
    required this.priorityLabel,
    required this.priorityColor,
  });

  final String title;
  final String date;
  final String referenceCode;
  final String statusLabel;
  final Color statusColor;
  final String priorityLabel;
  final Color priorityColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w14,
        vertical: AppSizes.h14,
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
      child: Row(
        children: [
          const SupportTicketCardIcon(),
          horizontalSpace(AppSizes.w12),
          Expanded(
            child: SupportTicketCardInfo(
              title: title,
              date: date,
              referenceCode: referenceCode,
            ),
          ),
          horizontalSpace(AppSizes.w12),
          SupportTicketCardBadges(
            statusLabel: statusLabel,
            statusColor: statusColor,
            priorityLabel: priorityLabel,
            priorityColor: priorityColor,
          ),
        ],
      ),
    );
  }
}
