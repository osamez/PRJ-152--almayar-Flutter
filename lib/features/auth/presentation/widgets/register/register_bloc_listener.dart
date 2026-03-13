part of '../../feature_imports.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) => previous.registerState != current.registerState,
      listener: (context, state) {
        state.registerState.whenOrNull(
          loading: () => LoadingDialog.show(context),
          data: (message) {
            LoadingDialog.hide(context);
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => RegisterSuccessDialog(
                message: message.message ?? '',
              ),
            );
          },
          error: (msg) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.error,
              description: msg.tr(),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
