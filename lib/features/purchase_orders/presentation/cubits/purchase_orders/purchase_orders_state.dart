part of '../../feature_imports.dart';

class PurchaseOrdersState extends Equatable {
  final Async<PurchaseOrdersResponseModel> getPurchaseRequestsState;
  final List<PurchaseOrderModel> orders;
  final int? selectedStatusId;
  final String? searchCode;
  final int currentPage;
  final bool isLoadingMore;
  final bool isSearchLoading;
  final bool isPaginationLoading;
  final bool hasMore;

  const PurchaseOrdersState({
    this.getPurchaseRequestsState = const AsyncInitial(),
    this.orders = const [],
    this.selectedStatusId,
    this.searchCode,
    this.currentPage = 1,
    this.isLoadingMore = false,
    this.isSearchLoading = false,
    this.isPaginationLoading = false,
    this.hasMore = true,
  });

  PurchaseOrdersState copyWith({
    Async<PurchaseOrdersResponseModel>? getPurchaseRequestsState,
    List<PurchaseOrderModel>? orders,
    int? selectedStatusId,
    String? searchCode,
    int? currentPage,
    bool? isLoadingMore,
    bool? isSearchLoading,
    bool? isPaginationLoading,
    bool? hasMore,
  }) {
    return PurchaseOrdersState(
      getPurchaseRequestsState:
          getPurchaseRequestsState ?? this.getPurchaseRequestsState,
      orders: orders ?? this.orders,
      selectedStatusId: selectedStatusId ?? this.selectedStatusId,
      searchCode: searchCode ?? this.searchCode,
      currentPage: currentPage ?? this.currentPage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isSearchLoading: isSearchLoading ?? this.isSearchLoading,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  List<Object?> get props => [
    getPurchaseRequestsState,
    orders,
    selectedStatusId,
    searchCode,
    currentPage,
    isLoadingMore,
    isSearchLoading,
    isPaginationLoading,
    hasMore,
  ];
}
