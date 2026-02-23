part of '../feature_imports.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: PageView.builder(
        controller: context.read<OnboardingCubit>().pageController,
        itemCount: onBoardingData.length,
        onPageChanged: (value) =>
            context.read<OnboardingCubit>().onPageChanged(value),
        itemBuilder: (context, index) {
          return PageViewItem(data: onBoardingData[index]);
        },
      ),
    );
  }
}
