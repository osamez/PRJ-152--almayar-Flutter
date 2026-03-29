part of '../../feature_imports.dart';

class SupportTicketCardBadges extends StatelessWidget {
  const SupportTicketCardBadges({
    super.key,
    required this.statusLabel,
    required this.statusColor,
    required this.priorityLabel,
    required this.priorityColor,
  });

  final String statusLabel;
  final Color statusColor;
  final String priorityLabel;
  final Color priorityColor;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StatusBadge(label: statusLabel, color: statusColor),
          verticalSpace(AppSizes.h6),
          StatusBadge(label: priorityLabel, color: priorityColor),
        ],
      ),
    );
  }
}
