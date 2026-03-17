part of '../feature_imports.dart';

class DeliveryRequestItemDetailsView extends StatelessWidget {
  const DeliveryRequestItemDetailsView({super.key, required this.order});
  final DeliveryOrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.delivery_request_details_title.tr(),
      ),
      backgroundColor: AppColors.offWhite,
      body: SafeArea(child: RequestItemDetailsViewBody(order: order)),
    );
  }
}
