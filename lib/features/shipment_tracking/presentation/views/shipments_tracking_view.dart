part of '../feature_imports.dart';

class ShipmentsTrackingView extends StatelessWidget {
  const ShipmentsTrackingView({super.key, this.fromMain = false});
  final bool fromMain;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ShipmentTrackingCubit>()..getShipmentStatusCounts(),
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: CustomAppBar(
          title: LocaleKeys.shipment_tracking_title.tr(),
          hideBackButton: fromMain,
        ),
        body: const ShipmentsTrackingViewBody().withPadding(
          horizontal: AppSizes.w20,
          vertical: AppSizes.h24,
        ),
      ),
    );
  }
}
