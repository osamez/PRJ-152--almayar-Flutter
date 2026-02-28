part of '../feature_imports.dart';

class ShipmentsTrackingView extends StatelessWidget {
  const ShipmentsTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShipmentTrackingCubit(),
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: CustomAppBar(title: LocaleKeys.shipment_tracking_title.tr()),
        body: const ShipmentsTrackingViewBody().withPadding(
          horizontal: AppSizes.w20,
          vertical: AppSizes.h24,
        ),
      ),
    );
  }
}
