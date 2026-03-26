part of '../../feature_imports.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return const _RegisterBlocListenerStateful();
  }
}

class _RegisterBlocListenerStateful extends StatefulWidget {
  const _RegisterBlocListenerStateful();

  @override
  State<_RegisterBlocListenerStateful> createState() =>
      _RegisterBlocListenerStatefulState();
}

class _RegisterBlocListenerStatefulState
    extends State<_RegisterBlocListenerStateful> {
  bool isDialogShowing = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          previous.registerState != current.registerState,
      listener: (context, state) {
        state.registerState.whenOrNull(
          loading: () {
            isDialogShowing = true;
            LoadingDialog.show(context);
          },
          data: (message) {
            if (isDialogShowing) {
              LoadingDialog.hide(context);
              isDialogShowing = false;
            }
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => RegisterSuccessDialog(
                message: message.message ?? '',
              ),
            );
          },
          error: (failure) {
            if (isDialogShowing) {
              LoadingDialog.hide(context);
              isDialogShowing = false;
            }
            showAppSnackbar(
              context: context,
              type: SnackbarType.error,
              description: failure.error.tr(),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
