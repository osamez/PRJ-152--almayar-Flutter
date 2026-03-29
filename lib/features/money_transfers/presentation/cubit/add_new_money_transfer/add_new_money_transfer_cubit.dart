part of '../../feature_imports.dart';

class AddNewMoneyTransferCubit extends Cubit<AddNewMoneyTransferState> {
  final MoneyTransfersRepo _repo;
  final InternetService _internetService;

  AddNewMoneyTransferCubit(this._repo, this._internetService)
    : super(const AddNewMoneyTransferState());

  Future<void> getMoneyTransferCurrencies() async {
    emit(state.copyWith(getMoneyTransferCurrenciesState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          getMoneyTransferCurrenciesState: AsyncError(
            ApiErrorModel(
              error: LocaleKeys.no_internet_error.tr(),
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = await _repo.getMoneyTransferCurrencies();

    result.when(
      onSuccess: (response) {
        emit(
          state.copyWith(
            getMoneyTransferCurrenciesState: AsyncData(response.data ?? []),
            currencies: response.data ?? [],
          ),
        );
      },
      onFailure: (error) {
        emit(
          state.copyWith(getMoneyTransferCurrenciesState: AsyncError(error)),
        );
      },
    );
  }

  Future<void> addMoneyTransfer({
    List<File>? invoiceImages,
    String? invoiceValue,
    String? paymentCurrencyId,
    String? currencyId,
    String? supplierName,
    String? supplierAddress,
    String? supplierPhoneCode,
    String? supplierPhone,
    String? notes,
  }) async {
    emit(state.copyWith(addMoneyTransferState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          addMoneyTransferState: AsyncError(
            ApiErrorModel(
              error: LocaleKeys.no_internet_error.tr(),
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = await _repo.addMoneyTransfer(
      invoiceImages: invoiceImages,
      invoiceValue: invoiceValue,
      paymentCurrencyId: paymentCurrencyId,
      currencyId: currencyId,
      supplierName: supplierName,
      supplierAddress: supplierAddress,
      supplierPhoneCode: supplierPhoneCode,
      supplierPhone: supplierPhone,
      notes: notes,
    );

    result.when(
      onSuccess: (response) {
        emit(state.copyWith(addMoneyTransferState: AsyncData(response)));
      },
      onFailure: (error) {
        emit(state.copyWith(addMoneyTransferState: AsyncError(error)));
      },
    );
  }

  void selectInvoiceCurrency(MoneyTransferCurrencyModel? value) {
    emit(state.copyWith(selectedInvoiceCurrency: value));
  }

  void selectPaymentCurrency(MoneyTransferCurrencyModel? value) {
    emit(state.copyWith(selectedPaymentCurrency: value));
  }

  void addInvoiceFiles(List<File> files) {
    emit(state.copyWith(invoiceFiles: [...state.invoiceFiles, ...files]));
  }

  void removeInvoiceFile(int index) {
    final List<File> currentFiles = List.from(state.invoiceFiles);
    currentFiles.removeAt(index);
    emit(state.copyWith(invoiceFiles: currentFiles));
  }

  Future<void> noteCalculateMoneyTransfer(NoteCalculateRequest request) async {
    emit(state.copyWith(noteCalculateMoneyTransferState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          noteCalculateMoneyTransferState: AsyncError(
            ApiErrorModel(
              error: LocaleKeys.no_internet_error.tr(),
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = await _repo.noteCalculateMoneyTransfer(request);

    result.when(
      onSuccess: (data) {
        emit(
          state.copyWith(
            noteCalculateMoneyTransferState: AsyncData(data.data!),
          ),
        );
      },
      onFailure: (error) {
        emit(
          state.copyWith(noteCalculateMoneyTransferState: AsyncError(error)),
        );
      },
    );
  }
}
