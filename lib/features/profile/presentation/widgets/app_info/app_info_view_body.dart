part of '../../feature_imports.dart';

class AppInfoViewBody extends StatelessWidget {
  const AppInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h24,
      ),
      child: Text(
        LocaleKeys.profile_terms_and_conditions_content.tr(),
        style: AppTextStyleFactory.create(
          size: 16,
          weight: FontWeight.w700,
          color: AppColors.darkSlate,
        ),
      ),
    );
  }
}
