part of '../feature_imports.dart';

class ShipmentsTypeView extends StatelessWidget {
  const ShipmentsTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShipmentTrackingCubit(),
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: CustomAppBar(title: LocaleKeys.shipment_tracking_title.tr()),
        body: const ShipmentsTypeViewBody(),
      ),
    );
  }
}
