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
                context.go(Routes.resetPassword);
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
        ),
      ],
      child: const SizedBox.shrink(),
    );
  }
}

