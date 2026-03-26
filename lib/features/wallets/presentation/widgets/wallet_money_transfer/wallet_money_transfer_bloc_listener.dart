part of '../../feature_imports.dart';

class WalletMoneyTransferBlocListener extends StatelessWidget {
  final Widget child;
  const WalletMoneyTransferBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WalletMoneyTransferCubit, WalletMoneyTransferState>(
          listenWhen: (previous, current) =>
              previous.sendOtpState != current.sendOtpState,
          listener: (context, state) {
            state.sendOtpState.whenOrNull(
              loading: () => LoadingDialog.show(context),
              data: (data) {
                LoadingDialog.hide(context);
                ConfirmTransferBottomSheet.show(context);
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
        ),
        BlocListener<WalletMoneyTransferCubit, WalletMoneyTransferState>(
          listenWhen: (previous, current) =>
              previous.transferState != current.transferState,
          listener: (context, state) {
            state.transferState.whenOrNull(
              loading: () => LoadingDialog.show(context),
              data: (data) {
                LoadingDialog.hide(context);
                showAppSnackbar(
                  context: context,
                  type: SnackbarType.success,
                  description: data.message ?? '',
                );
                context.pop(); // Close bottom sheet
                context.pop(true); // Close transfer view
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
        ),
      ],
      child: child,
    );
  }
}
