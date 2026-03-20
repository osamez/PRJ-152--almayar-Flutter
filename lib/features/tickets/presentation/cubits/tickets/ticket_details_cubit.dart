part of '../../feature_imports.dart';

class TicketDetailsCubit extends Cubit<TicketDetailsState> {
  final TicketsRepo _ticketsRepo;
  final InternetService _internetService;

  TicketDetailsCubit(this._ticketsRepo, this._internetService)
    : super(const TicketDetailsState());

  Future<void> getTicketDetails(int ticketId) async {
    emit(state.copyWith(getTicketDetailsState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          getTicketDetailsState: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              message: LocaleKeys.no_internet_error.tr(),
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = await _ticketsRepo.getTicketDetails(ticketId);

    result.when(
      onSuccess: (data) =>
          emit(state.copyWith(getTicketDetailsState: AsyncData(data.data!))),
      onFailure: (error) =>
          emit(state.copyWith(getTicketDetailsState: AsyncError(error))),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(selectedFile: File(image.path)));
    }
  }

  void removeImage() {
    emit(state.copyWith(clearSelectedFile: true));
  }

  Future<void> replyTicket({
    required String ticketId,
    String? description,
  }) async {
    final currentTicket = state.getTicketDetailsState.valueOrNull;
    if (currentTicket == null) return;

    final file = state.selectedFile;

    // Optimistic Update: Add a temporary reply
    final tempReply = TicketReplyModel(
      id: -1, // Temporary ID
      from: 'me', // Assuming 'me' or similar to identify current user
      description: description,
      file: file?.path,
      createdAt: DateTime.now().toIso8601String(),
    );

    final updatedReplies =
        <TicketReplyModel>[...(currentTicket.replies ?? []), tempReply];
    final optimisticTicket = currentTicket.copyWith(replies: updatedReplies);

    emit(
      state.copyWith(
        replyTicketState: const AsyncLoading(),
        getTicketDetailsState: AsyncData(optimisticTicket),
        clearSelectedFile: true,
      ),
    );

    if (!await _internetService.isConnected()) {
      // Revert optimistic update on no internet
      final revertedReplies = (currentTicket.replies ?? [])
          .where((element) => element.id != -1)
          .toList();
      emit(
        state.copyWith(
          replyTicketState: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              message: LocaleKeys.no_internet_error.tr(),
              status: LocalStatusCodes.connectionError,
            ),
          ),
          getTicketDetailsState: AsyncData(
            currentTicket.copyWith(replies: revertedReplies),
          ),
          selectedFile: file, // Restore file on failure
        ),
      );
      return;
    }

    final result = await _ticketsRepo.replyTicket(
      ticketId: ticketId,
      description: description,
      file: file,
    );

    result.when(
      onSuccess: (data) {
        // Replace temp reply with real one or just update list
        final finalReplies =
            (state.getTicketDetailsState.valueOrNull?.replies ?? [])
                .where((element) => element.id != -1)
                .toList();
        finalReplies.add(data.data!);

        emit(
          state.copyWith(
            replyTicketState: AsyncData(data.data!),
            getTicketDetailsState: AsyncData(
              currentTicket.copyWith(replies: finalReplies),
            ),
            clearSelectedFile: true,
          ),
        );
      },
      onFailure: (error) {
        // Revert optimistic update on failure
        final revertedReplies =
            (state.getTicketDetailsState.valueOrNull?.replies ?? [])
                .where((element) => element.id != -1)
                .toList();
        emit(
          state.copyWith(
            replyTicketState: AsyncError(error),
            getTicketDetailsState: AsyncData(
              currentTicket.copyWith(replies: revertedReplies),
            ),
            selectedFile: file, // Restore file on failure
          ),
        );
      },
    );
  }
}
