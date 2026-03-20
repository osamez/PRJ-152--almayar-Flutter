part of '../../feature_imports.dart';

class TicketDetailsState extends Equatable {
  final Async<TicketModel> getTicketDetailsState;
  final Async<TicketReplyModel> replyTicketState;
  final File? selectedFile;

  const TicketDetailsState({
    this.getTicketDetailsState = const AsyncInitial(),
    this.replyTicketState = const AsyncInitial(),
    this.selectedFile,
  });

  TicketDetailsState copyWith({
    Async<TicketModel>? getTicketDetailsState,
    Async<TicketReplyModel>? replyTicketState,
    File? selectedFile,
    bool clearSelectedFile = false,
  }) {
    return TicketDetailsState(
      getTicketDetailsState:
          getTicketDetailsState ?? this.getTicketDetailsState,
      replyTicketState: replyTicketState ?? this.replyTicketState,
      selectedFile: clearSelectedFile ? null : selectedFile ?? this.selectedFile,
    );
  }

  @override
  List<Object?> get props =>
      [getTicketDetailsState, replyTicketState, selectedFile];
}
