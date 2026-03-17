part of '../../feature_imports.dart';

class AddPurchaseOrderState extends Equatable {
  final Async<List<WalletModel>> getMyWalletsState;
  final Async<ShoppingSitesResponseModel> getShoppingSitesState;
  final Async<MessageModel> addPurchaseRequestState;
  final WalletModel? selectedWallet;
  final ShoppingSiteModel? selectedShoppingSite;

  // Pagination for shopping sites dropdown
  final List<ShoppingSiteModel> shoppingSitesList;
  final int shoppingSitesPage;
  final bool shoppingSitesHasMore;

  const AddPurchaseOrderState({
    this.getMyWalletsState = const AsyncInitial(),
    this.getShoppingSitesState = const AsyncInitial(),
    this.addPurchaseRequestState = const AsyncInitial(),
    this.selectedWallet,
    this.selectedShoppingSite,
    this.shoppingSitesList = const [],
    this.shoppingSitesPage = 1,
    this.shoppingSitesHasMore = true,
  });

  // Only wallets govern the initial skeleton/error — sites load lazily in the dropdown.
  bool get isLoadingInitial => getMyWalletsState.isLoading;

  bool get isErrorInitial => getMyWalletsState.isError;

  ApiErrorModel? get errorInitial =>
      (getMyWalletsState is AsyncError<List<WalletModel>>)
          ? (getMyWalletsState as AsyncError<List<WalletModel>>).failure
          : null;

  AddPurchaseOrderState copyWith({
    Async<List<WalletModel>>? getMyWalletsState,
    Async<ShoppingSitesResponseModel>? getShoppingSitesState,
    Async<MessageModel>? addPurchaseRequestState,
    WalletModel? selectedWallet,
    ShoppingSiteModel? selectedShoppingSite,
    List<ShoppingSiteModel>? shoppingSitesList,
    int? shoppingSitesPage,
    bool? shoppingSitesHasMore,
    bool clearSelectedWallet = false,
    bool clearSelectedShoppingSite = false,
  }) {
    return AddPurchaseOrderState(
      getMyWalletsState: getMyWalletsState ?? this.getMyWalletsState,
      getShoppingSitesState:
          getShoppingSitesState ?? this.getShoppingSitesState,
      addPurchaseRequestState:
          addPurchaseRequestState ?? this.addPurchaseRequestState,
      selectedWallet:
          clearSelectedWallet ? null : selectedWallet ?? this.selectedWallet,
      selectedShoppingSite: clearSelectedShoppingSite
          ? null
          : selectedShoppingSite ?? this.selectedShoppingSite,
      shoppingSitesList: shoppingSitesList ?? this.shoppingSitesList,
      shoppingSitesPage: shoppingSitesPage ?? this.shoppingSitesPage,
      shoppingSitesHasMore: shoppingSitesHasMore ?? this.shoppingSitesHasMore,
    );
  }

  @override
  List<Object?> get props => [
        getMyWalletsState,
        getShoppingSitesState,
        addPurchaseRequestState,
        selectedWallet,
        selectedShoppingSite,
        shoppingSitesList,
        shoppingSitesPage,
        shoppingSitesHasMore,
      ];
}
