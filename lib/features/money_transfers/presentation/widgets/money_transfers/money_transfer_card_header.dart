part of '../../feature_imports.dart';

class MoneyTransferCardHeader extends StatelessWidget {
  const MoneyTransferCardHeader({
    super.key,
    required this.phoneNumber,
    required this.date,
    required this.statusLabel,
    required this.statusColor,
  });

  final String phoneNumber;
  final String date;
  final String statusLabel;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconRoundedBox(
          iconPath: AppAssets.svgSwap,
          width: AppSizes.w48,
          height: AppSizes.h48,
          backgroundColor: AppColors.greenBg,
          iconColor: AppColors.green,
        ),
        horizontalSpace(AppSizes.w10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                phoneNumber,
                style: AppTextStyleFactory.create(
                  size: 12,
                  weight: FontWeight.w700,
                  color: AppColors.darkSlate,
                ),
              ),
              verticalSpace(AppSizes.h4),
              IconTextRow(
                iconPath: AppAssets.svgCalendar,
                text: date,
                iconHeight: AppSizes.h16,
                iconWidth: AppSizes.w16,
                iconColor: AppColors.darkText,
                textColor: AppColors.darkText,
                textWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
        MoneyTransferStatusBadge(label: statusLabel, color: statusColor),
      ],
    );
  }
}
