part of '../../feature_imports.dart';

class EditProfileDeleteAccountBlocListener extends StatelessWidget {
  const EditProfileDeleteAccountBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listenWhen: (previous, current) =>
          previous.deleteAccountState != current.deleteAccountState,
      listener: (context, state) {
        state.deleteAccountState.whenOrNull(
          loading: () => LoadingDialog.show(context),
          data: (message) {
            LoadingDialog.hide(context);

            context.go(Routes.login);
            showAppSnackbar(
              context: context,
              type: SnackbarType.success,
              description: message.message!,
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
