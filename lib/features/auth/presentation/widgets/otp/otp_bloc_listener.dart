part of '../../feature_imports.dart';

class OtpBlocListener extends StatelessWidget {
  const OtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OtpCubit, OtpState>(
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
                  extra: ResetPasswordParams(
                    phone: state.whatsappNumber,
                    phoneKey: state.whatsappKey,
                    otp: state.otpCode,
                  ),
                );
              },
              error: (failure) {
                LoadingDialog.hide(context);
                showAppSnackbar(
                  context: context,
                  type: SnackbarType.error,
                  description: failure.error,
                );
              },
            );
          },
        ),
        BlocListener<OtpCubit, OtpState>(
          listenWhen: (previous, current) =>
              previous.sendOtpState != current.sendOtpState,
          listener: (context, state) {
            state.sendOtpState.whenOrNull(
              loading: () => LoadingDialog.show(context),
              data: (response) {
                LoadingDialog.hide(context);
                showAppSnackbar(
                  context: context,
                  type: SnackbarType.success,
                  description: response.message ?? 'Success',
                );
              },
              error: (failure) {
                LoadingDialog.hide(context);
                showAppSnackbar(
                  context: context,
                  type: SnackbarType.error,
                  description: failure.error,
                );
              },
            );
          },
        ),
      ],
      child: const SizedBox.shrink(),
    );
  }
}
