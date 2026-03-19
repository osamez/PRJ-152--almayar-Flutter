part of '../../feature_imports.dart';

class ChangePasswordBlocListener extends StatelessWidget {
  const ChangePasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listenWhen: (previous, current) =>
          previous.changePasswordState != current.changePasswordState,
      listener: (context, state) {
        state.changePasswordState.whenOrNull(
          loading: () => LoadingDialog.show(context),
          data: (response) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.success,
              description: response.message!,
            );
            context.pop();
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
