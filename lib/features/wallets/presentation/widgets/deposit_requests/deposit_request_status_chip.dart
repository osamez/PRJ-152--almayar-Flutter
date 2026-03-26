part of '../../feature_imports.dart';

class DepositRequestStatusChip extends StatelessWidget {
  const DepositRequestStatusChip({super.key, this.statusName});

  final String? statusName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: AppSizes.w10,
        vertical: AppSizes.h6,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightViolet.withValues(alpha: 0.32),
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        textDirection: TextDirection.ltr,
        children: [
          Text(
            statusName ?? LocaleKeys.deposit_requests_status_new.tr(),
            style: AppTextStyleFactory.create(
              size: 12,
              weight: FontWeight.w700,
              color: AppColors.deepViolet,
            ),
          ),
          horizontalSpace(AppSizes.w8),
          Container(
            width: AppSizes.w6,
            height: AppSizes.h6,
            decoration: const BoxDecoration(
              color: AppColors.deepViolet,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
