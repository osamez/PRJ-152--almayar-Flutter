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
            context.pushNamed(
              Routes.otp,
              extra: OtpParams(
                phone: state.whatsappNumber,
                phoneKey: state.whatsappKey,
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
      child: const SizedBox.shrink(),
    );
  }
}
