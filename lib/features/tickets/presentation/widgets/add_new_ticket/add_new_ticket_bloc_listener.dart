part of '../../feature_imports.dart';

class AddNewTicketBlocListener extends StatelessWidget {
  const AddNewTicketBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNewTicketCubit, AddNewTicketState>(
      listenWhen: (previous, current) =>
          previous.createTicketState != current.createTicketState,
      listener: (context, state) {
        state.createTicketState.whenOrNull(
          loading: () => LoadingDialog.show(context),
          data: (ticket) {
            LoadingDialog.hide(context);
            showAppSnackbar(
              context: context,
              type: SnackbarType.success,
              description: LocaleKeys.added_successfully.tr(),
            );
            context.pop(true); // Return true to refresh list if needed
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
