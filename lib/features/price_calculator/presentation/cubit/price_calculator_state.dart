part of 'price_calculator_cubit.dart';

class PriceCalculatorState extends Equatable {
  final Async<List<AppBranchModel>> receivingBranches;
  final Async<List<AppBranchModel>> deliveryBranches;
  final Async<List<ShipmentCategoryModel>> shipmentCategories;
  final Async<PriceCalculatorResponseModel> calculationResult;

  final String shipmentType; // air, sea
  final String flightType; // fast, slow
  final AppBranchModel? selectedReceivingBranch;
  final AppBranchModel? selectedDeliveryBranch;
  final ShipmentCategoryModel? selectedCategory;
  final String weight;
  final String size;

  const PriceCalculatorState({
    this.receivingBranches = const AsyncInitial(),
    this.deliveryBranches = const AsyncInitial(),
    this.shipmentCategories = const AsyncInitial(),
    this.calculationResult = const AsyncInitial(),
    this.shipmentType = 'air',
    this.flightType = 'slow',
    this.selectedReceivingBranch,
    this.selectedDeliveryBranch,
    this.selectedCategory,
    this.weight = '',
    this.size = '',
  });

  bool get isLoadingInitial =>
      receivingBranches.isLoading ||
      deliveryBranches.isLoading ||
      shipmentCategories.isLoading;

  bool get isErrorInitial =>
      receivingBranches.isError ||
      deliveryBranches.isError ||
      shipmentCategories.isError;

  ApiErrorModel? get errorInitial => (receivingBranches is AsyncError)
      ? (receivingBranches as AsyncError).failure
      : (deliveryBranches is AsyncError)
      ? (deliveryBranches as AsyncError).failure
      : (shipmentCategories is AsyncError)
      ? (shipmentCategories as AsyncError).failure
      : null;

  PriceCalculatorState copyWith({
    Async<List<AppBranchModel>>? receivingBranches,
    Async<List<AppBranchModel>>? deliveryBranches,
    Async<List<ShipmentCategoryModel>>? shipmentCategories,
    Async<PriceCalculatorResponseModel>? calculationResult,
    String? shipmentType,
    String? flightType,
    AppBranchModel? selectedReceivingBranch,
    AppBranchModel? selectedDeliveryBranch,
    ShipmentCategoryModel? selectedCategory,
    ShipmentContentModel? selectedContent,
    String? weight,
    String? size,
  }) {
    return PriceCalculatorState(
      receivingBranches: receivingBranches ?? this.receivingBranches,
      deliveryBranches: deliveryBranches ?? this.deliveryBranches,
      shipmentCategories: shipmentCategories ?? this.shipmentCategories,
      calculationResult: calculationResult ?? this.calculationResult,
      shipmentType: shipmentType ?? this.shipmentType,
      flightType: flightType ?? this.flightType,
      selectedReceivingBranch:
          selectedReceivingBranch ?? this.selectedReceivingBranch,
      selectedDeliveryBranch:
          selectedDeliveryBranch ?? this.selectedDeliveryBranch,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      weight: weight ?? this.weight,
      size: size ?? this.size,
    );
  }

  @override
  List<Object?> get props => [
    receivingBranches,
    deliveryBranches,
    shipmentCategories,
    calculationResult,
    shipmentType,
    flightType,
    selectedReceivingBranch,
    selectedDeliveryBranch,
    selectedCategory,
    weight,
    size,
  ];
}
