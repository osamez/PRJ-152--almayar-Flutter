part of '../../feature_imports.dart';

class TicketDetailsDescriptionCard extends StatelessWidget {
  final String? description;
  const TicketDetailsDescriptionCard({super.key, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w10,
        vertical: AppSizes.h10,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow1.withValues(alpha: 0.8),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.ticket_details_description.tr(),
            style: AppTextStyleFactory.create(
              size: 13,
              weight: FontWeight.w700,
              color: AppColors.darkText,
            ),
          ),
          verticalSpace(AppSizes.h10),
          Text(
            description ?? '',
            style: AppTextStyleFactory.create(
              size: 14,
              weight: FontWeight.w300,
              color: AppColors.darkText,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
