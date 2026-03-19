part of '../../feature_imports.dart';

class ProfileLogoutBlocListener extends StatelessWidget {
  final Widget child;
  const ProfileLogoutBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          previous.logoutState != current.logoutState,
      listener: (context, state) {
        state.logoutState.whenOrNull(
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
          initial: () {},
        );
      },
      child: child,
    );
  }
}
