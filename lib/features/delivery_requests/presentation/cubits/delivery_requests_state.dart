part of '../feature_imports.dart';

class DeliveryRequestsState extends Equatable {
  final Async<DeliveryOrdersResponseModel> getDeliveryRequestsOrdersState;
  final List<DeliveryOrderModel> deliveryRequestsOrdersList;
  final DeliveryOrdersResponseModel? cachedDeliveryOrdersResponse;
  final List<DeliveryOrderModel> cachedDeliveryRequestsOrdersList;
  final String searchQuery;
  final String selectedType; // 'personal' or 'delivery_service'
  final int currentPage;
  final bool hasMore;

  const DeliveryRequestsState({
    this.getDeliveryRequestsOrdersState = const AsyncInitial(),
    this.deliveryRequestsOrdersList = const [],
    this.cachedDeliveryOrdersResponse,
    this.cachedDeliveryRequestsOrdersList = const [],
    this.searchQuery = '',
    this.selectedType = 'personal',
    this.currentPage = 1,
    this.hasMore = true,
  });

  DeliveryRequestsState copyWith({
    Async<DeliveryOrdersResponseModel>? getDeliveryRequestsOrdersState,
    List<DeliveryOrderModel>? deliveryRequestsOrdersList,
    DeliveryOrdersResponseModel? cachedDeliveryOrdersResponse,
    bool clearCache = false,
    List<DeliveryOrderModel>? cachedDeliveryRequestsOrdersList,
    String? searchQuery,
    String? selectedType,
    int? currentPage,
    bool? hasMore,
  }) {
    return DeliveryRequestsState(
      getDeliveryRequestsOrdersState:
          getDeliveryRequestsOrdersState ?? this.getDeliveryRequestsOrdersState,
      deliveryRequestsOrdersList:
          deliveryRequestsOrdersList ?? this.deliveryRequestsOrdersList,
      cachedDeliveryOrdersResponse: clearCache
          ? null
          : (cachedDeliveryOrdersResponse ?? this.cachedDeliveryOrdersResponse),
      cachedDeliveryRequestsOrdersList: clearCache
          ? const []
          : (cachedDeliveryRequestsOrdersList ?? this.cachedDeliveryRequestsOrdersList),
      searchQuery: searchQuery ?? this.searchQuery,
      selectedType: selectedType ?? this.selectedType,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  List<Object?> get props => [
        getDeliveryRequestsOrdersState,
        deliveryRequestsOrdersList,
        cachedDeliveryOrdersResponse,
        cachedDeliveryRequestsOrdersList,
        searchQuery,
        selectedType,
        currentPage,
        hasMore,
      ];
}
