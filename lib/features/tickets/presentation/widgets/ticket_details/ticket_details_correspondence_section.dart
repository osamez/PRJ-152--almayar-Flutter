part of '../../feature_imports.dart';

class TicketDetailsCorrespondenceSection extends StatelessWidget {
  final List<TicketReplyModel> replies;
  const TicketDetailsCorrespondenceSection({super.key, required this.replies});

  @override
  Widget build(BuildContext context) {
    if (replies.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          LocaleKeys.ticket_details_correspondence.tr(),
          style: AppTextStyleFactory.create(
            size: AppSizes.h16,
            weight: FontWeight.w700,
            color: AppColors.darkText,
          ),
        ),
        verticalSpace(AppSizes.h16),
        ...replies.map((reply) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TicketDetailsMessageBubble(
                message: reply.description ?? '',
                date: _formatDate(reply.createdAt),
                time: _formatTime(reply.createdAt),
                isFromUser: reply.from == 'me' || reply.from == 'user',
                fileUrl: reply.file,
              ),
              verticalSpace(AppSizes.h12),
            ],
          );
        }),
      ],
    );
  }

  String _formatDate(String? dateTime) {
    if (dateTime == null || dateTime.isEmpty) return '';
    try {
      final date = DateTime.parse(dateTime);
      return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
    } catch (e) {
      return dateTime.split(' ').first;
    }
  }

  String _formatTime(String? dateTime) {
    if (dateTime == null || dateTime.isEmpty) return '';
    try {
      final date = DateTime.parse(dateTime);
      final hour24 = date.hour;
      final hour12 = hour24 > 12 ? hour24 - 12 : (hour24 == 0 ? 12 : hour24);
      final minute = date.minute.toString().padLeft(2, '0');
      final period = hour24 >= 12 ? 'م' : 'ص';
      return '$hour12:$minute$period';
    } catch (e) {
      return dateTime.contains(' ') ? dateTime.split(' ').last : ' ';
    }
  }
}
