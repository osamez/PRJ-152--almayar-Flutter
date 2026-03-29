part of '../../feature_imports.dart';

class ReceiveShipmentViewBody extends StatefulWidget {
  const ReceiveShipmentViewBody({super.key, required this.shipmentType});

  final ShipmentType shipmentType;

  @override
  State<ReceiveShipmentViewBody> createState() =>
      _ReceiveShipmentViewBodyState();
}

class _ReceiveShipmentViewBodyState extends State<ReceiveShipmentViewBody> {
  final _formKey = GlobalKey<FormState>();

  final _supplierPhoneController = TextEditingController();
  final _trackingCodeController = TextEditingController();
  final _boxesCountController = TextEditingController();
  final _totalVolumeController = TextEditingController();
  final _totalWeightController = TextEditingController();
  final _inspectionNoteController = TextEditingController();

  final _imagePicker = ImagePickerService();
  String _phoneCode = '+218';

  @override
  void dispose() {
    _supplierPhoneController.dispose();
    _trackingCodeController.dispose();
    _boxesCountController.dispose();
    _totalVolumeController.dispose();
    _totalWeightController.dispose();
    _inspectionNoteController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final file = await _imagePicker.pickImage(type: ImageSourceType.gallery);
    if (file != null) {
      if (mounted) {
        context.read<ReceiveShipmentCubit>().addShipmentImage(file);
      }
    }
  }

  Future<void> _pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      if (mounted) {
        context.read<ReceiveShipmentCubit>().addDocumentFile(
          File(result.files.single.path!),
        );
      }
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<ReceiveShipmentCubit>().addShipmentRequest(
        shipmentType: widget.shipmentType,
        supplierPhoneCode: _phoneCode,
        supplierPhone: _supplierPhoneController.text,
        trackingNumber: _trackingCodeController.text,
        boxesCount: _boxesCountController.text,
        totalWeight: _totalWeightController.text,
        totalSize: _totalVolumeController.text,
        inspectionNote: _inspectionNoteController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiveShipmentCubit, ReceiveShipmentState>(
      builder: (context, state) {
        final isLoading =
            state.receivingBranchesState.isLoading ||
            state.deliveryBranchesState.isLoading ||
            state.categoriesState.isLoading ||
            state.contentsState.isLoading;

        final cubit = context.read<ReceiveShipmentCubit>();

        return Skeletonizer(
          enabled: isLoading,
          child: Stack(
            children: [
              const ReceiveShipmentBlocListener(),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.w20,
                    vertical: AppSizes.h32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShippingTypeSection(
                        shipmentType: widget.shipmentType,
                        isPrimarySelected: state.isPrimarySelected,
                        onPrimarySelected: () => cubit.updateShippingWay(true),
                        onSecondarySelected: () =>
                            cubit.updateShippingWay(false),
                      ),
                      verticalSpace(AppSizes.h20),
                      const PickupBranchField(),
                      verticalSpace(AppSizes.h16),
                      const DeliveryBranchField(),
                      verticalSpace(AppSizes.h16),
                      PhoneFormField(
                        controller: _supplierPhoneController,
                        title: LocaleKeys.receive_shipment_supplier_phone.tr(),
                        hintText: LocaleKeys.phone_hint.tr(),
                        onCountryChanged: (code) =>
                            setState(() => _phoneCode = code),
                        validator: (value, code) {
                          if (value == null || value.isEmpty) {
                            return LocaleKeys.phone_required.tr();
                          }
                          return null;
                        },
                      ),
                      verticalSpace(AppSizes.h16),
                      const ShipmentContentsDropdownList(),

                      verticalSpace(AppSizes.h16),
                      const ClassificationField(),
                      verticalSpace(AppSizes.h20),
                      BoxesAndContentsSection(
                        trackingNumberController: _trackingCodeController,
                        boxesCountController: _boxesCountController,
                      ),
                      verticalSpace(AppSizes.h24),
                      Center(
                        child: Image.asset(
                          AppAssets.imagesBoxes,
                          fit: BoxFit.contain,
                        ),
                      ),
                      verticalSpace(AppSizes.h16),
                      WeightVolumeSection(
                        volumeController: _totalVolumeController,
                        weightController: _totalWeightController,
                      ),
                      verticalSpace(AppSizes.h24),
                      InspectionServiceCard(
                        isEnabled: state.inspectionEnabled,
                        onToggle: (val) => cubit.updateInspectionStatus(val),
                        inspectionNoteController: _inspectionNoteController,
                      ),

                      verticalSpace(AppSizes.h20),
                      UploadMediaSection(
                        title: LocaleKeys.receive_shipment_photos.tr(),
                        hint: LocaleKeys.receive_shipment_add_photos.tr(),
                        files: state.shipmentImages,
                        onTap: _pickImage,
                        onRemove: cubit.removeShipmentImage,
                      ),
                      verticalSpace(AppSizes.h16),
                      UploadMediaSection(
                        title: LocaleKeys.receive_shipment_documents.tr(),
                        hint: LocaleKeys.receive_shipment_add_documents.tr(),
                        files: state.documentFiles,
                        onTap: _pickPdf,
                        onRemove: cubit.removeDocumentFile,
                        isPdf: true,
                      ),
                      verticalSpace(AppSizes.h24),
                      AppElevatedButton(
                        text: LocaleKeys.receive_shipment_create_request.tr(),
                        onPressed: _submit,
                      ),
                      verticalSpace(AppSizes.h20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
