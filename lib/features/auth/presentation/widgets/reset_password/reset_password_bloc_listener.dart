part of '../../feature_imports.dart';

class ResetPasswordBlocListener extends StatelessWidget {
  const ResetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listenWhen: (previous, current) =>
          previous.resetPasswordState != current.resetPasswordState,
      listener: (context, state) {
        state.resetPasswordState.whenOrNull(
          loading: () => LoadingDialog.show(context),
          data: (data) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.success,
              description: data.message ?? 'Password reset successfully',
            );
            context.go(Routes.login);
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
