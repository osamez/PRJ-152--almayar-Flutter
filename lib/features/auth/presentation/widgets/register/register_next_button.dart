part of '../../feature_imports.dart';

class RegisterNextButton extends StatelessWidget {
  const RegisterNextButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final isLastStep = state.isLastStep;
        return AppElevatedButton(
          onPressed: () {
            if (isLastStep) {
              context.read<RegisterCubit>().register();
            } else {
              if (formKey.currentState!.validate()) {
                context.read<RegisterCubit>().nextStep();
              }
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
