part of '../feature_imports.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAssets.imagesLogo,
          width: AppSizes.w180,
          height: AppSizes.h90,
        ),
        verticalSpace(AppSizes.h20),
        Text(
          LocaleKeys.welcome_message.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyleFactory.create(
            size: 19,
            weight: FontWeight.w400,
            color: AppColors.lightSmallText,
          ),
        ).center,
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyleFactory.create(
            size: 24,
            weight: FontWeight.w400,
            color: AppColors.darkBlueText,
          ),
        ).center,
      ],
    );
  }
}
