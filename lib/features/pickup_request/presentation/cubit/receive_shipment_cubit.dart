part of '../feature_imports.dart';

class ReceiveShipmentCubit extends Cubit<ReceiveShipmentState> {
  final PickupRequestRepository _repository;
  final InternetService _internetService;

  ReceiveShipmentCubit(this._repository, this._internetService)
    : super(const ReceiveShipmentState());

  Future<void> init({required String shippingType}) async {
    emit(
      state.copyWith(
        contentsState: const AsyncLoading(),
        categoriesState: const AsyncLoading(),
        receivingBranchesState: const AsyncLoading(),
        deliveryBranchesState: const AsyncLoading(),
        shippingType: shippingType,
      ),
    );

    if (!await _internetService.isConnected()) {
      final error = ApiErrorModel(
        error: LocaleKeys.shipment_pickup_requests_retry.tr(),
        status: LocalStatusCodes.connectionError,
      );
      emit(
        state.copyWith(
          contentsState: AsyncError(error),
          categoriesState: AsyncError(error),
          receivingBranchesState: AsyncError(error),
          deliveryBranchesState: AsyncError(error),
        ),
      );
      return;
    }

    final results = await Future.wait([
      _repository.getShipmentContents(),
      _repository.getShipmentCategories(),
      _repository.getReceivingBranches(),
      _repository.getDeliveryBranches(),
    ]);

    final contentsResult = results[0] as Result<List<ShipmentContentModel>>;
    final categoriesResult = results[1] as Result<List<ShipmentCategoryModel>>;
    final receivingBranchesResult = results[2] as Result<List<AppBranchModel>>;
    final deliveryBranchesResult = results[3] as Result<List<AppBranchModel>>;

    emit(
      state.copyWith(
        contentsState: contentsResult.when(
          onSuccess: (data) => AsyncData(data),
          onFailure: (error) => AsyncError(error),
        ),
        categoriesState: categoriesResult.when(
          onSuccess: (data) => AsyncData(data),
          onFailure: (error) => AsyncError(error),
        ),
        receivingBranchesState: receivingBranchesResult.when(
          onSuccess: (data) => AsyncData(data),
          onFailure: (error) => AsyncError(error),
        ),
        deliveryBranchesState: deliveryBranchesResult.when(
          onSuccess: (data) => AsyncData(data),
          onFailure: (error) => AsyncError(error),
        ),
      ),
    );
  }

  // Update methods
  void updatePickupBranch(AppBranchModel? branch) =>
      emit(state.copyWith(selectedPickupBranch: () => branch));

  void updateDeliveryBranch(AppBranchModel? branch) =>
      emit(state.copyWith(selectedDeliveryBranch: () => branch));

  void updateCategory(ShipmentCategoryModel? category) =>
      emit(state.copyWith(selectedCategory: () => category));

  void updateContent(ShipmentContentModel? content) =>
      emit(state.copyWith(selectedContent: () => content));

  void updateShippingWay(bool isPrimary) =>
      emit(state.copyWith(isPrimarySelected: isPrimary));

  void updateInspectionStatus(bool enabled) =>
      emit(state.copyWith(inspectionEnabled: enabled));

  void addShipmentImage(File file) {
    final newList = List<File>.from(state.shipmentImages)..add(file);
    emit(state.copyWith(shipmentImages: newList));
  }

  void removeShipmentImage(int index) {
    final newList = List<File>.from(state.shipmentImages)..removeAt(index);
    emit(state.copyWith(shipmentImages: newList));
  }

  void addDocumentFile(File file) {
    final newList = List<File>.from(state.documentFiles)..add(file);
    emit(state.copyWith(documentFiles: newList));
  }

  void removeDocumentFile(int index) {
    final newList = List<File>.from(state.documentFiles)..removeAt(index);
    emit(state.copyWith(documentFiles: newList));
  }

  Future<void> addShipmentRequest({
    required ShipmentType shipmentType,
    required String supplierPhoneCode,
    required String supplierPhone,
    required String trackingNumber,
    required String boxesCount,
    required String totalWeight,
    required String totalSize,
    String? inspectionNote,
  }) async {
    emit(state.copyWith(submitState: const AsyncLoading()));

    if (state.shipmentImages.isEmpty) {
      emit(
        state.copyWith(
          submitState: AsyncError(
            ApiErrorModel(
              error: LocaleKeys.please_select_shipment_photos.tr(),
              status: LocalStatusCodes.defaultError,
            ),
          ),
        ),
      );
      return;
    }

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          submitState: AsyncError(
            ApiErrorModel(
              error: LocaleKeys.shipment_pickup_requests_retry.tr(),
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final shipmentImagesMultipart = await Future.wait(
      state.shipmentImages.map((file) => MultipartFile.fromFile(file.path)),
    );
    final documentFilesMultipart = await Future.wait(
      state.documentFiles.map((file) => MultipartFile.fromFile(file.path)),
    );

    final result = await _repository.addShipmentRequest(
      receivingBranchId: state.selectedPickupBranch?.id.toString() ?? '0',
      deliveryBranchId: state.selectedDeliveryBranch?.id.toString() ?? '0',
      boxesCount: boxesCount,
      totalWeight: totalWeight,
      shipmentContentId: state.selectedContent?.id.toString() ?? '0',
      shipmentType: state.shippingType,
      flightType: state.isPrimarySelected ? 'fast' : 'slow',
      totalSize: totalSize,
      categoryId: state.selectedCategory?.id.toString() ?? '0',
      trackingNumber: trackingNumber,
      supplierPhoneCode: supplierPhoneCode,
      supplierPhone: supplierPhone,
      inspectionRequest: state.inspectionEnabled ? '1' : '0',
      inspectionNote: inspectionNote,
      documentImages: documentFilesMultipart,
      shipmentImages: shipmentImagesMultipart,
    );

    result.when(
      onSuccess: (data) => emit(state.copyWith(submitState: AsyncData(data))),
      onFailure: (error) =>
          emit(state.copyWith(submitState: AsyncError(error))),
    );
  }
}
