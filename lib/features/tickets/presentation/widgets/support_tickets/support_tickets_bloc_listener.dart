part of '../../feature_imports.dart';

class SupportTicketsBlocListener extends StatelessWidget {
  const SupportTicketsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TicketsCubit, TicketsState>(
      listenWhen: (previous, current) =>
          previous.loadMoreTicketsState != current.loadMoreTicketsState,
      listener: (context, state) {
        state.loadMoreTicketsState.whenOrNull(
          error: (failure) {
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
