part of '../feature_imports.dart';

class ShipmentAddressDetailsView extends StatelessWidget {
  const ShipmentAddressDetailsView({super.key, required this.branchId});

  final int branchId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShipmentsAddressesCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: CustomAppBar(
          title: LocaleKeys.shipments_international_title.tr(),
        ),
        body: ShipmentAddressDetailsViewBody(branchId: branchId),
      ),
    );
  }
}
