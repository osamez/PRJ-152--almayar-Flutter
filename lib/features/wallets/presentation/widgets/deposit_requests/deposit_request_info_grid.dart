part of '../../feature_imports.dart';

class DepositRequestInfoGrid extends StatelessWidget {
  const DepositRequestInfoGrid({
    super.key,
    required this.deposit,
    required this.onTapTransferProof,
  });

  final DepositModel deposit;

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
                  deposit.transferType?.name ?? '',
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
                  deposit.createdAt ?? '',
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
                  deposit.processedByName ?? '',
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
                  onTap: () => _handleFileTap(context),
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

  void _handleFileTap(BuildContext context) {
    if (deposit.attachment == null || deposit.attachment!.isEmpty) {
      return;
    }
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                child: deposit.attachment!.startsWith('http')
                    ? CustomCachedImage(
                        imageUrl: deposit.attachment!,
                        fit: BoxFit.contain,
                      )
                    : Image.file(
                        File(deposit.attachment!),
                        fit: BoxFit.contain,
                      ),
              ),
            ),
            Positioned(
              top: AppSizes.h40,
              right: AppSizes.w16,
              child: IconButton(
                icon: const Icon(Icons.close, color: AppColors.white, size: 30),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
