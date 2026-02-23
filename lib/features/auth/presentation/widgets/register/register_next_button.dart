part of '../../feature_imports.dart';

class RegisterNextButton extends StatelessWidget {
  const RegisterNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RegisterCubit, RegisterState, bool>(
      selector: (state) => state.isLastStep,
      builder: (context, isLastStep) {
        return AppElevatedButton(
          onPressed: () {
            if (isLastStep) {
              context.pushNamed(Routes.otp);
            } else {
              context.read<RegisterCubit>().nextStep();
            }
          },
          text: isLastStep
              ? LocaleKeys.complete_registration.tr()
              : LocaleKeys.next_step.tr(),
        );
      },
    );
  }
}
