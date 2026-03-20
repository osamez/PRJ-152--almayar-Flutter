part of '../../feature_imports.dart';

class AddNewTicketState extends Equatable {
  final Async<List<TicketPriorityModel>> getTicketPrioritiesState;
  final Async<List<TicketSystemModel>> getTicketSystemsState;
  final Async<TicketModel> createTicketState;
  final TicketPriorityModel? selectedPriority;
  final TicketSystemModel? selectedSystem;
  final List<File> selectedFiles;

  const AddNewTicketState({
    this.getTicketPrioritiesState = const AsyncInitial(),
    this.getTicketSystemsState = const AsyncInitial(),
    this.createTicketState = const AsyncInitial(),
    this.selectedPriority,
    this.selectedSystem,
    this.selectedFiles = const [],
  });

  bool get isLoadingInitial =>
      getTicketPrioritiesState.isLoading || getTicketSystemsState.isLoading;

  bool get isErrorInitial =>
      getTicketPrioritiesState.isError || getTicketSystemsState.isError;

  ApiErrorModel? get errorInitial => (getTicketPrioritiesState is AsyncError)
      ? (getTicketPrioritiesState as AsyncError).failure
      : (getTicketSystemsState is AsyncError)
          ? (getTicketSystemsState as AsyncError).failure
          : null;

  AddNewTicketState copyWith({
    Async<List<TicketPriorityModel>>? getTicketPrioritiesState,
    Async<List<TicketSystemModel>>? getTicketSystemsState,
    Async<TicketModel>? createTicketState,
    TicketPriorityModel? selectedPriority,
    TicketSystemModel? selectedSystem,
    List<File>? selectedFiles,
    bool clearSelectedPriority = false,
    bool clearSelectedSystem = false,
  }) {
    return AddNewTicketState(
      getTicketPrioritiesState:
          getTicketPrioritiesState ?? this.getTicketPrioritiesState,
      getTicketSystemsState:
          getTicketSystemsState ?? this.getTicketSystemsState,
      createTicketState: createTicketState ?? this.createTicketState,
      selectedPriority: clearSelectedPriority
          ? null
          : selectedPriority ?? this.selectedPriority,
      selectedSystem: clearSelectedSystem
          ? null
          : selectedSystem ?? this.selectedSystem,
      selectedFiles: selectedFiles ?? this.selectedFiles,
    );
  }

  @override
  List<Object?> get props => [
        getTicketPrioritiesState,
        getTicketSystemsState,
        createTicketState,
        selectedPriority,
        selectedSystem,
        selectedFiles,
      ];
}
