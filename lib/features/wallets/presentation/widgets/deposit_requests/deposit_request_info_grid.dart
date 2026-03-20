part of '../../feature_imports.dart';

class DepositRequestInfoGrid extends StatelessWidget {
  const DepositRequestInfoGrid({super.key, required this.onTapTransferProof});

  final VoidCallback onTapTransferProof;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          textDirection: TextDirection.ltr,
          children: [
            Expanded(
              child: DepositRequestInfoBox(
                title: LocaleKeys.deposit_requests_transfer_type.tr(),
                content: Text(
                  LocaleKeys.deposit_requests_transfer_type_lypay.tr(),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyleFactory.create(
                    size: 12,
                    weight: FontWeight.w600,
                    color: AppColors.lightHeadingText,
                  ),
                ),
              ),
            ),
            horizontalSpace(AppSizes.w12),
            Expanded(
              child: DepositRequestInfoBox(
                title: LocaleKeys.deposit_requests_created_at.tr(),
                content: Text(
                  LocaleKeys.deposit_requests_sample_created_at.tr(),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyleFactory.create(
                    size: 12,
                    weight: FontWeight.w600,
                    color: AppColors.lightHeadingText,
                  ),
                ),
              ),
            ),
          ],
        ),
        verticalSpace(AppSizes.h12),
        Row(
          textDirection: TextDirection.ltr,
          children: [
            Expanded(
              child: DepositRequestInfoBox(
                title: LocaleKeys.deposit_requests_processed_by.tr(),
                content: Text(
                  LocaleKeys.deposit_requests_sample_processed_by.tr(),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyleFactory.create(
                    size: 12,
                    weight: FontWeight.w600,
                    color: AppColors.lightHeadingText,
                  ),
                ),
              ),
            ),
            horizontalSpace(AppSizes.w12),
            Expanded(
              child: DepositRequestInfoBox(
                title: LocaleKeys.deposit_requests_transfer_proof.tr(),
                content: CustomInkWellWidget(
                  radius: AppSizes.radiusSm,
                  onTap: onTapTransferProof,
                  child: Text(
                    LocaleKeys.deposit_requests_view.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyleFactory.create(
                      size: 12,
                      weight: FontWeight.w700,
                      color: AppColors.lightViolet,
                    ).copyWith(decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
