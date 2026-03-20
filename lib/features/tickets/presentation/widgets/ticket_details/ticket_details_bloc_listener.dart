part of '../../feature_imports.dart';

class TicketDetailsBlocListener extends StatelessWidget {
  const TicketDetailsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TicketDetailsCubit, TicketDetailsState>(
      listenWhen:
          (previous, current) =>
              previous.replyTicketState != current.replyTicketState,
      listener: (context, state) {
        state.replyTicketState.whenOrNull(
          error: (failure) {
            showAppSnackbar(
              context: context,
              type: SnackbarType.error,
              description: failure.message ?? '',
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
