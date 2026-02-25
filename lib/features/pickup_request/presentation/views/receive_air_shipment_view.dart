part of '../feature_imports.dart';

class ReceiveAirShipmentView extends StatelessWidget {
  const ReceiveAirShipmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.receive_air_shipment_title.tr()),
      body: const ReceiveAirShipmentViewBody(),
    );
  }
}
