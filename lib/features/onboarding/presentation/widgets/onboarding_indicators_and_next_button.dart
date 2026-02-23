part of '../feature_imports.dart';

class OnboardingIndicatorsAndNextButton extends StatelessWidget {
  const OnboardingIndicatorsAndNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppSizes.w20,
              children: List.generate(
                onBoardingData.length,
                (index) => DotIndicator(isActive: index == state),
              ),
            ),
            verticalSpace(AppSizes.h66),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.skip.tr(),
                  style: AppTextStyleFactory.create(
                    size: 13,
                    weight: FontWeight.w400,
                    color: AppColors.offWhite,
                  ),
                ).onTap(
                  function: () {
                    context.read<OnboardingCubit>().skipPage();
                  },
                ),
                AppElevatedButton(
                  text: LocaleKeys.next.tr(),
                  onPressed: () {
                    context.read<OnboardingCubit>().nextPage();
                  },
                  width: AppSizes.w102,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
