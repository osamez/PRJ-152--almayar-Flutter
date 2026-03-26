part of '../../feature_imports.dart';

class DepositRequestsBlocListener extends StatelessWidget {
  const DepositRequestsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DepositRequestsCubit, DepositRequestsState>(
      listenWhen: (previous, current) =>
          previous.addDepositState != current.addDepositState,
      listener: (context, state) {
        state.addDepositState.whenOrNull(
          loading: () => LoadingDialog.show(context),
          data: (message) async {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.success,
              description: message,
            );
            context.pop(); // Close bottom sheet
            context.read<DepositRequestsCubit>().clearAddDepositForm();
            await context.read<DepositRequestsCubit>().getDeposits(page: 1);
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
