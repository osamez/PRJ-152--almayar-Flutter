part of '../feature_imports.dart';

class ReceiveShipmentView extends StatelessWidget {
  const ReceiveShipmentView({super.key, required this.shipmentType});

  final ShipmentType shipmentType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ReceiveShipmentCubit>()..init(shippingType: shipmentType.name),
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: CustomAppBar(title: shipmentType.title),
        body: ReceiveShipmentViewBody(shipmentType: shipmentType),
      ),
    );
  }
}
