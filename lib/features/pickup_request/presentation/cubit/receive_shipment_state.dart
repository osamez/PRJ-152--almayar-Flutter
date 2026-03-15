part of '../feature_imports.dart';

class ReceiveShipmentState extends Equatable {
  final Async<List<ShipmentContentModel>> contentsState;
  final Async<List<ShipmentCategoryModel>> categoriesState;
  final Async<List<AppBranchModel>> receivingBranchesState;
  final Async<List<AppBranchModel>> deliveryBranchesState;
  final Async<BaseResponse<AddShipmentRequestResponseData>> submitState;

  // Form selections and states
  final AppBranchModel? selectedPickupBranch;
  final AppBranchModel? selectedDeliveryBranch;
  final ShipmentCategoryModel? selectedCategory;
  final ShipmentContentModel? selectedContent;
  final bool isPrimarySelected;
  final bool inspectionEnabled;
  final List<File> shipmentImages;
  final List<File> documentFiles;
  final String shippingType;

  const ReceiveShipmentState({
    this.contentsState = const AsyncInitial(),
    this.categoriesState = const AsyncInitial(),
    this.receivingBranchesState = const AsyncInitial(),
    this.deliveryBranchesState = const AsyncInitial(),
    this.submitState = const AsyncInitial(),
    this.selectedPickupBranch,
    this.selectedDeliveryBranch,
    this.selectedCategory,
    this.selectedContent,
    this.isPrimarySelected = true,
    this.inspectionEnabled = false,
    this.shipmentImages = const [],
    this.documentFiles = const [],
    this.shippingType = '',
  });

  ReceiveShipmentState copyWith({
    Async<List<ShipmentContentModel>>? contentsState,
    Async<List<ShipmentCategoryModel>>? categoriesState,
    Async<List<AppBranchModel>>? receivingBranchesState,
    Async<List<AppBranchModel>>? deliveryBranchesState,
    Async<BaseResponse<AddShipmentRequestResponseData>>? submitState,
    AppBranchModel? Function()? selectedPickupBranch,
    AppBranchModel? Function()? selectedDeliveryBranch,
    ShipmentCategoryModel? Function()? selectedCategory,
    ShipmentContentModel? Function()? selectedContent,
    bool? isPrimarySelected,
    bool? inspectionEnabled,
    List<File>? shipmentImages,
    List<File>? documentFiles,
    String? shippingType,
  }) {
    return ReceiveShipmentState(
      contentsState: contentsState ?? this.contentsState,
      categoriesState: categoriesState ?? this.categoriesState,
      receivingBranchesState:
          receivingBranchesState ?? this.receivingBranchesState,
      deliveryBranchesState:
          deliveryBranchesState ?? this.deliveryBranchesState,
      submitState: submitState ?? this.submitState,
      selectedPickupBranch: selectedPickupBranch != null
          ? selectedPickupBranch()
          : this.selectedPickupBranch,
      selectedDeliveryBranch: selectedDeliveryBranch != null
          ? selectedDeliveryBranch()
          : this.selectedDeliveryBranch,
      selectedCategory: selectedCategory != null
          ? selectedCategory()
          : this.selectedCategory,
      selectedContent: selectedContent != null
          ? selectedContent()
          : this.selectedContent,
      isPrimarySelected: isPrimarySelected ?? this.isPrimarySelected,
      inspectionEnabled: inspectionEnabled ?? this.inspectionEnabled,
      shipmentImages: shipmentImages ?? this.shipmentImages,
      documentFiles: documentFiles ?? this.documentFiles,
      shippingType: shippingType ?? this.shippingType,
    );
  }

  @override
  List<Object?> get props => [
    contentsState,
    categoriesState,
    receivingBranchesState,
    deliveryBranchesState,
    submitState,
    selectedPickupBranch,
    selectedDeliveryBranch,
    selectedCategory,
    selectedContent,
    isPrimarySelected,
    inspectionEnabled,
    shipmentImages,
    documentFiles,
    shippingType,
  ];
}
