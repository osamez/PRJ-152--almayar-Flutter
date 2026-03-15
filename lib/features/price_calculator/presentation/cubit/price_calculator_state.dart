part of 'price_calculator_cubit.dart';

class PriceCalculatorState extends Equatable {
  final Async<List<AppBranchModel>> receivingBranches;
  final Async<List<AppBranchModel>> deliveryBranches;
  final Async<List<ShipmentCategoryModel>> shipmentCategories;
  final Async<List<ShipmentContentModel>> shipmentContents;
  final Async<PriceCalculatorResponseModel> calculationResult;

  final String shipmentType; // air, sea
  final String flightType; // fast, slow
  final AppBranchModel? selectedReceivingBranch;
  final AppBranchModel? selectedDeliveryBranch;
  final ShipmentCategoryModel? selectedCategory;
  final ShipmentContentModel? selectedContent;
  final String weight;
  final String size;

  const PriceCalculatorState({
    this.receivingBranches = const AsyncInitial(),
    this.deliveryBranches = const AsyncInitial(),
    this.shipmentCategories = const AsyncInitial(),
    this.shipmentContents = const AsyncInitial(),
    this.calculationResult = const AsyncInitial(),
    this.shipmentType = 'air',
    this.flightType = 'fast',
    this.selectedReceivingBranch,
    this.selectedDeliveryBranch,
    this.selectedCategory,
    this.selectedContent,
    this.weight = '',
    this.size = '',
  });

  bool get isLoadingInitial =>
      receivingBranches.isLoading ||
      deliveryBranches.isLoading ||
      shipmentCategories.isLoading ||
      shipmentContents.isLoading;

  bool get isErrorInitial =>
      receivingBranches.isError ||
      deliveryBranches.isError ||
      shipmentCategories.isError ||
      shipmentContents.isError;

  ApiErrorModel? get errorInitial => (receivingBranches is AsyncError)
      ? (receivingBranches as AsyncError).failure
      : (deliveryBranches is AsyncError)
      ? (deliveryBranches as AsyncError).failure
      : (shipmentCategories is AsyncError)
      ? (shipmentCategories as AsyncError).failure
      : (shipmentContents is AsyncError)
      ? (shipmentContents as AsyncError).failure
      : null;

  PriceCalculatorState copyWith({
    Async<List<AppBranchModel>>? receivingBranches,
    Async<List<AppBranchModel>>? deliveryBranches,
    Async<List<ShipmentCategoryModel>>? shipmentCategories,
    Async<List<ShipmentContentModel>>? shipmentContents,
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
      shipmentContents: shipmentContents ?? this.shipmentContents,
      calculationResult: calculationResult ?? this.calculationResult,
      shipmentType: shipmentType ?? this.shipmentType,
      flightType: flightType ?? this.flightType,
      selectedReceivingBranch:
          selectedReceivingBranch ?? this.selectedReceivingBranch,
      selectedDeliveryBranch:
          selectedDeliveryBranch ?? this.selectedDeliveryBranch,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedContent: selectedContent ?? this.selectedContent,
      weight: weight ?? this.weight,
      size: size ?? this.size,
    );
  }

  @override
  List<Object?> get props => [
    receivingBranches,
    deliveryBranches,
    shipmentCategories,
    shipmentContents,
    calculationResult,
    shipmentType,
    flightType,
    selectedReceivingBranch,
    selectedDeliveryBranch,
    selectedCategory,
    selectedContent,
    weight,
    size,
  ];
}
