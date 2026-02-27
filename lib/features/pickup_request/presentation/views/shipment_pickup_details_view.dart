part of '../feature_imports.dart';

class ShipmentPickupDetailsView extends StatelessWidget {
  const ShipmentPickupDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.shipment_details_title.tr()),
      body: const ShipmentPickupDetailsViewBody(),
    );
  }
}
