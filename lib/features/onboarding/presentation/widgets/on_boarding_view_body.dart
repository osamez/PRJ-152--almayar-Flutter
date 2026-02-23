part of '../feature_imports.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.imagesOnboardingBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imagesOnboardingOverlay),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(AppSizes.h162),
            const OnBoardingPageView(),
            const OnboardingIndicatorsAndNextButton(),
            verticalSpace(AppSizes.h50),
          ],
        ).withPadding(horizontal: AppSizes.w30, vertical: AppSizes.h20),
      ),
    );
  }
}
