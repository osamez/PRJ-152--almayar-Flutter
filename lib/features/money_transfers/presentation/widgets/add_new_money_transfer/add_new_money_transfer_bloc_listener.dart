part of '../../feature_imports.dart';

class AddNewMoneyTransferBlocListener extends StatelessWidget {
  const AddNewMoneyTransferBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNewMoneyTransferCubit, AddNewMoneyTransferState>(
      listenWhen: (previous, current) =>
          previous.addMoneyTransferState != current.addMoneyTransferState,
      listener: (context, state) {
        state.addMoneyTransferState.whenOrNull(
          loading: () => LoadingDialog.show(context),
          data: (data) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.success,
              description: data.message ?? '',
            );
            context.pop(true);
          },
          error: (error) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.error,
              description: error.error,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
