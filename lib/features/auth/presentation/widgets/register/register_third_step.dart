part of '../../feature_imports.dart';

class RegisterThirdStep extends StatelessWidget {
  const RegisterThirdStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.insert_id_proof.tr(),
          style: AppTextStyleFactory.create(
            size: 13,
            weight: FontWeight.w700,
            color: AppColors.lightHeadingText,
          ),
        ),
        Text(
          LocaleKeys.id_photo_quality_hint.tr(),
          style: AppTextStyleFactory.create(
            size: 13,
            weight: FontWeight.w400,
            color: AppColors.lightHeadingText,
          ),
        ),
        Text(
          LocaleKeys.id_photo_format_hint.tr(),
          style: AppTextStyleFactory.create(
            size: 13,
            weight: FontWeight.w400,
            color: AppColors.lightHeadingText,
          ),
        ),
        Text(
          LocaleKeys.id_photo_size_hint.tr(),
          style: AppTextStyleFactory.create(
            size: 13,
            weight: FontWeight.w400,
            color: AppColors.lightHeadingText,
          ),
        ),
        verticalSpace(AppSizes.h32),
        SizedBox(
          height: AppSizes.h177,
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
        ),
      ],
    );
  }
}
