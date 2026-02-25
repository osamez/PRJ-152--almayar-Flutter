part of '../../feature_imports.dart';

class ReceiveShipmentViewBody extends StatefulWidget {
  const ReceiveShipmentViewBody({super.key, required this.shipmentType});

  final ShipmentType shipmentType;

  @override
  State<ReceiveShipmentViewBody> createState() =>
      _ReceiveShipmentViewBodyState();
}

class _ReceiveShipmentViewBodyState extends State<ReceiveShipmentViewBody> {
  bool _isPrimarySelected = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShippingTypeSection(
            shipmentType: widget.shipmentType,
            isPrimarySelected: _isPrimarySelected,
            onPrimarySelected: () => setState(() => _isPrimarySelected = true),
            onSecondarySelected: () =>
                setState(() => _isPrimarySelected = false),
          ),
          verticalSpace(AppSizes.h20),
          const PickupBranchField(),
          verticalSpace(AppSizes.h16),
          const DeliveryBranchField(),
          verticalSpace(AppSizes.h16),
          const SupplierPhoneField(),
          verticalSpace(AppSizes.h16),
          const TrackingCodeField(),
          verticalSpace(AppSizes.h16),
          const ClassificationField(),
          verticalSpace(AppSizes.h20),
          const BoxesAndContentsSection(),
          verticalSpace(AppSizes.h24),
          Center(
            child: Image.asset(AppAssets.imagesBoxes, fit: BoxFit.contain),
          ),
          verticalSpace(AppSizes.h16),
          const WeightVolumeSection(),
          verticalSpace(AppSizes.h24),
          const InspectionServiceCard(),
          verticalSpace(AppSizes.h20),
          if (widget.shipmentType == ShipmentType.air)
            const InspectionNoteField(),
          verticalSpace(AppSizes.h20),
          UploadSection(
            title: LocaleKeys.receive_shipment_photos.tr(),
            hint: LocaleKeys.receive_shipment_add_photos.tr(),
            onTap: () {},
          ),
          verticalSpace(AppSizes.h16),
          UploadSection(
            title: LocaleKeys.receive_shipment_documents.tr(),
            hint: LocaleKeys.receive_shipment_add_documents.tr(),
            onTap: () {},
          ),
          verticalSpace(AppSizes.h24),
          AppElevatedButton(
            text: LocaleKeys.receive_shipment_create_request.tr(),
            onPressed: () {
              context.pushNamed(Routes.shipmentPickupRequests);
            },
          ),
          verticalSpace(AppSizes.h20),
        ],
      ),
    );
  }
}
