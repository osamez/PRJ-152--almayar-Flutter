part of '../../feature_imports.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listenWhen: (previous, current) =>
          previous.sendOtpState != current.sendOtpState,
      listener: (context, state) {
        state.sendOtpState.whenOrNull(
          loading: () => LoadingDialog.show(context),
          data: (message) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.success,
              description: message.message ?? '',
            );
            context.push(Routes.otp);
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
