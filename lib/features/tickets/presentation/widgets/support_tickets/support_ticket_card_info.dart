part of '../../feature_imports.dart';

class SupportTicketCardInfo extends StatelessWidget {
  const SupportTicketCardInfo({
    super.key,
    required this.title,
    required this.date,
    required this.referenceCode,
  });

  final String title;
  final String date;
  final String referenceCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextStyleFactory.create(
            size: 13,
            weight: FontWeight.w700,
            color: AppColors.darkText,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpace(AppSizes.h4),
        IconTextRow(
          iconPath: AppAssets.svgCalendar,
          text: date,
          iconColor: AppColors.darkText,
          textColor: AppColors.darkText,
          textSize: 9,
          textWeight: FontWeight.w700,
        ),

        verticalSpace(AppSizes.h4),
        Text(
          referenceCode,
          style: AppTextStyleFactory.create(
            size: 12,
            weight: FontWeight.w400,
            color: AppColors.darkText,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
