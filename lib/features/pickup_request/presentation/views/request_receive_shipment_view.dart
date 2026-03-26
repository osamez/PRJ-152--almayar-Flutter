part of '../feature_imports.dart';

class RequestReceiveShipmentView extends StatelessWidget {
  const RequestReceiveShipmentView({super.key, this.fromMain = false});
  final bool fromMain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.home_request_shipment.tr(),
        hideBackButton: fromMain,
      ),

      body: const RequestReceiveShipmentViewBody().withPadding(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h24,
      ),
    );
  }
}
