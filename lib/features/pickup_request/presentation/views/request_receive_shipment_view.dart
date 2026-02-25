part of '../feature_imports.dart';

class RequestReceiveShipmentView extends StatelessWidget {
  const RequestReceiveShipmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.home_request_shipment.tr()),
      body: const RequestReceiveShipmentViewBody().withPadding(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h24,
      ),
    );
  }
}
