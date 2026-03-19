part of '../../feature_imports.dart';

class DepositRequestCard extends StatelessWidget {
  const DepositRequestCard({super.key, required this.requestId});

  final int requestId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: AppSizes.w16,
        end: AppSizes.w16,
        top: AppSizes.h16,
        bottom: AppSizes.h16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow1.withValues(alpha: 0.8),
            blurRadius: 10,
            offset: const Offset(0, 2.77),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            textDirection: TextDirection.ltr,
            children: [
              Text(
                '#$requestId',
                style: AppTextStyleFactory.create(
                  size: 14,
                  weight: FontWeight.w700,
                  color: AppColors.darkText,
                ),
              ),
              const Spacer(),
              const DepositRequestStatusChip(),
            ],
          ),
          verticalSpace(AppSizes.h12),
          Text(
            LocaleKeys.deposit_requests_sample_amount.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyleFactory.create(
              size: 22,
              weight: FontWeight.w700,
              color: AppColors.darkText,
            ),
          ),
          verticalSpace(AppSizes.h16),
          DepositRequestInfoGrid(onTapTransferProof: () {}),
        ],
      ),
    );
  }
}
