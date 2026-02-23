part of '../../feature_imports.dart';

class UploadPlaceholder extends StatelessWidget {
  const UploadPlaceholder({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(AppSizes.radiusXxs),
          color: AppColors.orange,
          strokeWidth: 1,
          dashPattern: [AppSizes.w10, AppSizes.w4],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.w10,
                  vertical: AppSizes.h10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.deepViolet,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: SvgPicture.asset(
                  AppAssets.svgUpload,
                  width: AppSizes.w28,
                  height: AppSizes.h28,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              verticalSpace(AppSizes.h16),
              Text(
                LocaleKeys.tap_to_upload_id.tr(),
                style: AppTextStyleFactory.create(
                  size: 12,
                  weight: FontWeight.w600,
                  color: AppColors.deepViolet,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
