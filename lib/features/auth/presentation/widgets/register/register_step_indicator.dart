part of '../../feature_imports.dart';

class RegisterStepIndicator extends StatelessWidget {
  const RegisterStepIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RegisterCubit, RegisterState, int>(
      selector: (state) => state.currentStep,
      builder: (context, currentStep) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.step_x_of_y.tr(
                namedArgs: {
                  'current': currentStep.toString(),
                  'total': RegisterState.totalSteps.toString(),
                },
              ),
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w500,
                color: AppColors.darkBlueText,
              ),
            ),
            Row(
              spacing: AppSizes.w6,
              children: [
                DotIndicator(
                  isActive: currentStep == 1 || currentStep > 1,
                  inactiveColor: AppColors.notActive,
                ),
                DotIndicator(
                  isActive: currentStep == 2 || currentStep > 2,
                  inactiveColor: AppColors.notActive,
                ),
                DotIndicator(
                  isActive: currentStep == 3,
                  inactiveColor: AppColors.notActive,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
