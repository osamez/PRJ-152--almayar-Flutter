part of '../../feature_imports.dart';

class ReceiveAirShipmentViewBody extends StatefulWidget {
  const ReceiveAirShipmentViewBody({super.key});

  @override
  State<ReceiveAirShipmentViewBody> createState() =>
      _ReceiveAirShipmentViewBodyState();
}

class _ReceiveAirShipmentViewBodyState
    extends State<ReceiveAirShipmentViewBody> {
  bool _isExpressShipping = true;

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
            isExpressSelected: _isExpressShipping,
            onExpressSelected: () => setState(() => _isExpressShipping = true),
            onEconomySelected: () => setState(() => _isExpressShipping = false),
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
          const InspectionNoteField(),
          verticalSpace(AppSizes.h20),

          UploadSection(
            title: LocaleKeys.receive_air_shipment_photos.tr(),
            hint: LocaleKeys.receive_air_add_photos.tr(),
            onTap: () {},
          ),
          verticalSpace(AppSizes.h16),
          UploadSection(
            title: LocaleKeys.receive_air_shipment_documents.tr(),
            hint: LocaleKeys.receive_air_add_documents.tr(),
            onTap: () {},
          ),
          verticalSpace(AppSizes.h24),
          AppElevatedButton(
            text: LocaleKeys.receive_air_create_request.tr(),
            onPressed: () {},
          ),
          verticalSpace(AppSizes.h20),
        ],
      ),
    );
  }
}
