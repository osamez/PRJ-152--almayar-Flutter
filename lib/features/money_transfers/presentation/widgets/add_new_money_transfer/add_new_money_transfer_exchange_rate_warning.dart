part of '../../feature_imports.dart';

class AddNewMoneyTransferExchangeRateWarning extends StatelessWidget {
  const AddNewMoneyTransferExchangeRateWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h14,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.gray, width: 1),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomIconRoundedBox(
            iconPath: AppAssets.svgWarning,
            backgroundColor: AppColors.yellow,
            iconColor: AppColors.darkSlate,
            iconHeight: AppSizes.h22,
            iconWidth: AppSizes.w22,
            width: AppSizes.w32,
            height: AppSizes.h32,
            radius: AppSizes.radiusXxs,
            padding: const EdgeInsets.all(6),
          ),
          horizontalSpace(AppSizes.w12),
          Expanded(
            child: Text(
              LocaleKeys.add_money_transfer_exchange_rate_warning.tr(
                namedArgs: {'amount': '122', 'due': '915'},
              ),
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w400,
                color: AppColors.darkText,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          horizontalSpace(AppSizes.w10),
        ],
      ),
    );
  }
}
