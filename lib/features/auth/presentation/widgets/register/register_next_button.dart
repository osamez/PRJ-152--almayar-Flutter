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
              if (state.pickedImage == null) {
                showAppSnackbar(
                  context: context,
                  type: SnackbarType.error,
                  description: LocaleKeys.insert_id_proof.tr(),
                );
                return;
              }
              context.pushNamed(Routes.otp);
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
