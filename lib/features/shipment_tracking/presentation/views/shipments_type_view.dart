part of '../feature_imports.dart';

class ShipmentsTypeView extends StatelessWidget {
  const ShipmentsTypeView({super.key, this.params});

  final ShipmentsTypeParams? params;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShipmentTrackingCubit>(
        param1: params,
      ),
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: CustomAppBar(title: LocaleKeys.shipment_tracking_title.tr()),
        body: const ShipmentsTypeViewBody(),
      ),
    );
  }
}
