part of '../../feature_imports.dart';

class ShoppingSitesState extends Equatable {
  final Async<ShoppingSitesResponseModel> getShoppingSitesState;
  final ShoppingSitesResponseModel? cachedShoppingSites;
  final List<ShoppingSiteModel> sitesList;
  final String searchQuery;
  final int currentPage;
  final bool hasMore;
  final bool isPaginationLoading;

  const ShoppingSitesState({
    this.getShoppingSitesState = const AsyncInitial(),
    this.cachedShoppingSites,
    this.sitesList = const [],
    this.searchQuery = '',
    this.currentPage = 1,
    this.hasMore = false,
    this.isPaginationLoading = false,
  });

  ShoppingSitesState copyWith({
    Async<ShoppingSitesResponseModel>? getShoppingSitesState,
    ShoppingSitesResponseModel? cachedShoppingSites,
    List<ShoppingSiteModel>? sitesList,
    String? searchQuery,
    int? currentPage,
    bool? hasMore,
    bool? isPaginationLoading,
  }) {
    return ShoppingSitesState(
      getShoppingSitesState:
          getShoppingSitesState ?? this.getShoppingSitesState,
      cachedShoppingSites: cachedShoppingSites ?? this.cachedShoppingSites,
      sitesList: sitesList ?? this.sitesList,
      searchQuery: searchQuery ?? this.searchQuery,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
    );
  }

  @override
  List<Object?> get props => [
        getShoppingSitesState,
        cachedShoppingSites,
        sitesList,
        searchQuery,
        currentPage,
        hasMore,
        isPaginationLoading,
      ];
}
