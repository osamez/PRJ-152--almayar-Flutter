part of '../feature_imports.dart';

class ShipmentAddressDetailsParams {
  final int branchId;
  final String shipmentType;
  final String? flag;

  const ShipmentAddressDetailsParams({
    required this.branchId,
    required this.shipmentType,
    this.flag,
  });
}

class ShipmentAddressDetailsView extends StatelessWidget {
  const ShipmentAddressDetailsView({super.key, required this.params});

  final ShipmentAddressDetailsParams params;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShipmentsAddressesCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: CustomAppBar(
          title: LocaleKeys.shipments_international_title.tr(),
        ),
        body: ShipmentAddressDetailsViewBody(params: params),
      ),
    );
  }
}
