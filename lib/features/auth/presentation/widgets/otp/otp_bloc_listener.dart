part of '../../feature_imports.dart';

class OtpBlocListener extends StatelessWidget {
  const OtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listenWhen: (previous, current) =>
          previous.verifyOtpState != current.verifyOtpState,
      listener: (context, state) {
        state.verifyOtpState.whenOrNull(
          loading: () => LoadingDialog.show(context),
          data: (response) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.success,
              description: response.message ?? 'Success',
            );
            context.go(
              Routes.resetPassword,
            ); // Assuming verification goes to reset password or main, adjust accordingly
          },
          error: (msg) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.error,
              description: msg,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
