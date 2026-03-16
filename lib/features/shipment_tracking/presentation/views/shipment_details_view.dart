part of '../feature_imports.dart';

class ShipmentDetailsView extends StatelessWidget {
  const ShipmentDetailsView({super.key, required this.shipmentModel});
  final ShipmentModel shipmentModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.shipment_details_view_title.tr()),
      body: ShipmentDetailsViewBody(shipmentModel: shipmentModel),
    );
  }
}
