part of '../../feature_imports.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.loginState != current.loginState,
      listener: (context, state) {
        state.loginState.whenOrNull(
          loading: () => LoadingDialog.show(context),
          data: (response) async {
            await CacheHelper.setSecuredString(
              PrefsKeys.token,
              response.data?.token ?? '',
            );
            if (context.mounted) {
              LoadingDialog.hide(context);
              showAppSnackbar(
                context: context,
                type: SnackbarType.success,
                description: response.message ?? '',
              );
              context.go(Routes.main);
            }
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
      child: const SizedBox(),
    );
  }
}
