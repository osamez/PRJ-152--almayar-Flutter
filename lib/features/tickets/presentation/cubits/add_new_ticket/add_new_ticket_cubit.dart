part of '../../feature_imports.dart';

class AddNewTicketCubit extends Cubit<AddNewTicketState> {
  final TicketsRepo _repo;
  final InternetService _internetService;

  AddNewTicketCubit(this._repo, this._internetService)
    : super(const AddNewTicketState());

  Future<void> loadInitialData() async {
    emit(
      state.copyWith(
        getTicketPrioritiesState: const AsyncLoading(),
        getTicketSystemsState: const AsyncLoading(),
      ),
    );

    if (!await _internetService.isConnected()) {
      final error = ApiErrorModel(
        error: LocaleKeys.no_internet_error.tr(),
        status: LocalStatusCodes.connectionError,
      );
      emit(
        state.copyWith(
          getTicketPrioritiesState: AsyncError(error),
          getTicketSystemsState: AsyncError(error),
        ),
      );
      return;
    }

    final results = await Future.wait([
      _repo.getTicketPriorities(),
      _repo.getTicketSystems(),
    ]);

    final prioritiesResult =
        results[0] as Result<BaseResponse<List<TicketPriorityModel>>>;
    final systemsResult =
        results[1] as Result<BaseResponse<List<TicketSystemModel>>>;

    emit(
      state.copyWith(
        getTicketPrioritiesState: prioritiesResult.toAsyncUnwrapped(),
        getTicketSystemsState: systemsResult.toAsyncUnwrapped(),
      ),
    );
  }

  void selectPriority(TicketPriorityModel? priority) {
    emit(state.copyWith(selectedPriority: priority));
  }

  void selectSystem(TicketSystemModel? system) {
    emit(state.copyWith(selectedSystem: system));
  }

  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );
    if (result != null) {
      final newFiles = result.paths.map((path) => File(path!)).toList();
      emit(
        state.copyWith(selectedFiles: [...state.selectedFiles, ...newFiles]),
      );
    }
  }

  void removeFile(int index) {
    final updatedFiles = List<File>.from(state.selectedFiles)..removeAt(index);
    emit(state.copyWith(selectedFiles: updatedFiles));
  }

  Future<void> createTicket({
    required String title,
    required String description,
    String? shipmentCode,
  }) async {
    if (state.selectedPriority == null || state.selectedSystem == null) {
      return;
    }

    emit(state.copyWith(createTicketState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          createTicketState: AsyncError(
            ApiErrorModel(
              error: LocaleKeys.no_internet_error.tr(),
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final request = CreateTicketRequest(
      title: title,
      description: description,
      priority: state.selectedPriority?.id.toString(),
      toSystem: state.selectedSystem?.id.toString(),
      shipmentCode: shipmentCode,
    );

    final result = await _repo.createTicket(
      request: request,
      file: state.selectedFiles.firstOrNull,
    );

    result.when(
      onSuccess: (response) {
        emit(state.copyWith(createTicketState: AsyncData(response.data!)));
      },
      onFailure: (error) {
        emit(state.copyWith(createTicketState: AsyncError(error)));
      },
    );
  }
}
