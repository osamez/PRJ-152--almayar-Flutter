part of 'deposit_requests_cubit.dart';

class DepositRequestsState extends Equatable {
  final Async<DepositsResponseModel> getDepositsState;
  final Async<List<MoneyTransferCurrencyModel>> getMoneyTransferCurrenciesState;
  final Async<DepositMetadataModel> getDepositMetadataState;

  final List<DepositModel> depositsList;
  final int depositsPage;
  final bool depositsHasMore;
  final bool isDepositsPaginationLoading;

  final Async<String> addDepositState;

  final CurrencyModel? selectedCurrency;
  final TransferTypeModel? selectedTransferType;
  final List<File> selectedFiles;

  const DepositRequestsState({
    this.getDepositsState = const AsyncInitial(),
    this.getMoneyTransferCurrenciesState = const AsyncInitial(),
    this.getDepositMetadataState = const AsyncInitial(),
    this.depositsList = const <DepositModel>[],
    this.depositsPage = 1,
    this.depositsHasMore = true,
    this.isDepositsPaginationLoading = false,
    this.addDepositState = const AsyncInitial(),
    this.selectedCurrency,
    this.selectedTransferType,
    this.selectedFiles = const [],
  });

  bool get isLoadingInitial =>
      getDepositsState.isLoading ||
      getMoneyTransferCurrenciesState.isLoading ||
      getDepositMetadataState.isLoading;

  bool get isErrorInitial =>
      getDepositsState.isError ||
      getMoneyTransferCurrenciesState.isError ||
      getDepositMetadataState.isError;

  ApiErrorModel? get errorInitial =>
      getDepositsState.errorOrNull ??
      getMoneyTransferCurrenciesState.errorOrNull ??
      getDepositMetadataState.errorOrNull;

  List<DepositModel> get deposits => depositsList;

  List<CurrencyModel> get depositCurrencies =>
      getDepositMetadataState.valueOrNull?.currencies ??
      const <CurrencyModel>[];

  List<TransferTypeModel> get depositTransferTypes =>
      getDepositMetadataState.valueOrNull?.transferTypes ??
      const <TransferTypeModel>[];

  DepositRequestsState copyWith({
    Async<DepositsResponseModel>? getDepositsState,
    Async<List<MoneyTransferCurrencyModel>>? getMoneyTransferCurrenciesState,
    Async<DepositMetadataModel>? getDepositMetadataState,
    List<DepositModel>? depositsList,
    int? depositsPage,
    bool? depositsHasMore,
    bool? isDepositsPaginationLoading,
    Async<String>? addDepositState,
    CurrencyModel? Function()? selectedCurrency,
    TransferTypeModel? Function()? selectedTransferType,
    List<File>? selectedFiles,
  }) {
    return DepositRequestsState(
      getDepositsState: getDepositsState ?? this.getDepositsState,
      getMoneyTransferCurrenciesState:
          getMoneyTransferCurrenciesState ??
          this.getMoneyTransferCurrenciesState,
      getDepositMetadataState:
          getDepositMetadataState ?? this.getDepositMetadataState,
      depositsList: depositsList ?? this.depositsList,
      depositsPage: depositsPage ?? this.depositsPage,
      depositsHasMore: depositsHasMore ?? this.depositsHasMore,
      isDepositsPaginationLoading:
          isDepositsPaginationLoading ?? this.isDepositsPaginationLoading,
      addDepositState: addDepositState ?? this.addDepositState,
      selectedCurrency: selectedCurrency != null
          ? selectedCurrency()
          : this.selectedCurrency,
      selectedTransferType: selectedTransferType != null
          ? selectedTransferType()
          : this.selectedTransferType,
      selectedFiles: selectedFiles ?? this.selectedFiles,
    );
  }

  @override
  List<Object?> get props => [
    getDepositsState,
    getMoneyTransferCurrenciesState,
    getDepositMetadataState,
    depositsList,
    depositsPage,
    depositsHasMore,
    isDepositsPaginationLoading,
    addDepositState,
    selectedCurrency,
    selectedTransferType,
    selectedFiles,
  ];
}
