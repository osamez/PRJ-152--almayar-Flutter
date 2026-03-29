part of '../../feature_imports.dart';

class AddNewMoneyTransferState extends Equatable {
  final Async<List<MoneyTransferCurrencyModel>> getMoneyTransferCurrenciesState;
  final Async<MessageModel> addMoneyTransferState;
  final Async<NoteCalculateModel> noteCalculateMoneyTransferState;
  final List<MoneyTransferCurrencyModel> currencies;
  final MoneyTransferCurrencyModel? selectedInvoiceCurrency;
  final MoneyTransferCurrencyModel? selectedPaymentCurrency;
  final List<File> invoiceFiles;

  const AddNewMoneyTransferState({
    this.getMoneyTransferCurrenciesState = const AsyncInitial(),
    this.addMoneyTransferState = const AsyncInitial(),
    this.noteCalculateMoneyTransferState = const AsyncInitial(),
    this.currencies = const [],
    this.selectedInvoiceCurrency,
    this.selectedPaymentCurrency,
    this.invoiceFiles = const [],
  });

  bool get isLoadingInitial => getMoneyTransferCurrenciesState.isLoading;

  bool get isErrorInitial => getMoneyTransferCurrenciesState.isError;

  ApiErrorModel? get errorInitial =>
      getMoneyTransferCurrenciesState
          is AsyncError<List<MoneyTransferCurrencyModel>>
      ? (getMoneyTransferCurrenciesState
                as AsyncError<List<MoneyTransferCurrencyModel>>)
            .failure
      : null;

  AddNewMoneyTransferState copyWith({
    Async<List<MoneyTransferCurrencyModel>>? getMoneyTransferCurrenciesState,
    Async<MessageModel>? addMoneyTransferState,
    Async<NoteCalculateModel>? noteCalculateMoneyTransferState,
    List<MoneyTransferCurrencyModel>? currencies,
    MoneyTransferCurrencyModel? selectedInvoiceCurrency,
    MoneyTransferCurrencyModel? selectedPaymentCurrency,
    List<File>? invoiceFiles,
    bool clearInvoiceFiles = false,
    bool clearSelectedInvoiceCurrency = false,
    bool clearSelectedPaymentCurrency = false,
  }) {
    return AddNewMoneyTransferState(
      getMoneyTransferCurrenciesState:
          getMoneyTransferCurrenciesState ??
          this.getMoneyTransferCurrenciesState,
      addMoneyTransferState:
          addMoneyTransferState ?? this.addMoneyTransferState,
      noteCalculateMoneyTransferState:
          noteCalculateMoneyTransferState ??
          this.noteCalculateMoneyTransferState,
      currencies: currencies ?? this.currencies,
      selectedInvoiceCurrency: clearSelectedInvoiceCurrency
          ? null
          : selectedInvoiceCurrency ?? this.selectedInvoiceCurrency,
      selectedPaymentCurrency: clearSelectedPaymentCurrency
          ? null
          : selectedPaymentCurrency ?? this.selectedPaymentCurrency,
      invoiceFiles: clearInvoiceFiles ? [] : invoiceFiles ?? this.invoiceFiles,
    );
  }

  @override
  List<Object?> get props => [
    getMoneyTransferCurrenciesState,
    addMoneyTransferState,
    noteCalculateMoneyTransferState,
    currencies,
    selectedInvoiceCurrency,
    selectedPaymentCurrency,
    invoiceFiles,
  ];
}
