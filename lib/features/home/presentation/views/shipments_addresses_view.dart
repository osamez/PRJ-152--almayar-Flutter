part of '../feature_imports.dart';

class ShipmentsAddressesView extends StatelessWidget {
  const ShipmentsAddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(
        title: LocaleKeys.shipments_international_title.tr(),
      ),
      body: const ShipmentsAddressesViewBody().withPadding(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h24,
      ),
    );
  }
}
