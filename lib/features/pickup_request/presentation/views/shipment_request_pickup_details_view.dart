part of '../feature_imports.dart';

class PickupRequestDetailsView extends StatelessWidget {
  const PickupRequestDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.shipment_details_title.tr()),
      body: const ShipmentRequestPickupDetailsViewBody(),
    );
  }
}
