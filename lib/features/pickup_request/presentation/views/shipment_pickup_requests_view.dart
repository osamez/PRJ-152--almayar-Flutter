part of '../feature_imports.dart';

class ShipmentPickupRequestsView extends StatelessWidget {
  const ShipmentPickupRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.pickup_requests_title.tr()),
      body: const ShipmentPickupRequestsViewBody(),
    );
  }
}
