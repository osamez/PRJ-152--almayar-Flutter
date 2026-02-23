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
        const RegisterIdUploadArea(),
      ],
    );
  }
}
