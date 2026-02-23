part of '../../feature_imports.dart';

class RegisterStepContent extends StatelessWidget {
  const RegisterStepContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RegisterCubit, RegisterState, int>(
      selector: (state) => state.currentStep,
      builder: (context, currentStep) {
        return switch (currentStep) {
          1 => const RegisterFirstStep(),
          2 => const RegisterSecondStep(),
          _ => const RegisterThirdStep(),
        };
      },
    );
  }
}
