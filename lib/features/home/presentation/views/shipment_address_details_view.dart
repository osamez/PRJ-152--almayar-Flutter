part of '../feature_imports.dart';

class ShipmentAddressDetailsView extends StatelessWidget {
  const ShipmentAddressDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(
        title: LocaleKeys.shipments_international_title.tr(),
      ),
      body: const ShipmentAddressDetailsViewBody(),
    );
  }
}
