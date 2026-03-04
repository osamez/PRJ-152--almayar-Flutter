part of '../../feature_imports.dart';

class TicketDetailsCorrespondenceSection extends StatelessWidget {
  const TicketDetailsCorrespondenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          LocaleKeys.ticket_details_correspondence.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyleFactory.create(
            size: AppSizes.h16,
            weight: FontWeight.w700,
            color: AppColors.darkText,
          ),
        ),
        verticalSpace(AppSizes.h16),
        const TicketDetailsMessageBubble(
          message:
              'شحنة متأخرة جدا من تاريخ قديم شحنة متأخرة جدا من تاريخ قديم شحنة متأخرة جدا من تاريخ قديم شحنة متأخرة جدا من تاريخ قديم شحنة.',
          date: '22-10-2026',
          time: '1:55 م',
          isFromUser: false,
        ),
        verticalSpace(AppSizes.h12),
        const TicketDetailsMessageBubble(
          message:
              'شحنة متأخرة جدا من تاريخ قديم شحنة متأخرة جدا من تاريخ قديم شحنة متأخرة جدا من تاريخ قديم شحنة.',
          date: '22-10-2026',
          time: '1:55 م',
          isFromUser: true,
        ),
      ],
    );
  }
}
