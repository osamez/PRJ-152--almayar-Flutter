part of '../../feature_imports.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Column(
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
              LocaleKeys.please_login.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyleFactory.create(
                size: 24,
                weight: FontWeight.w400,
                color: AppColors.darkBlueText,
              ),
            ).center,
          ],
        ).withPadding(top: AppSizes.h56, horizontal: AppSizes.w20).toSliver,
        verticalSpace(AppSizes.h40).toSliver,
        const LoginForm(),
      ],
    );
  }
}
