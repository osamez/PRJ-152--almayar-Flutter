part of '../feature_imports.dart';

class DeliveryRequestsView extends StatelessWidget {
  const DeliveryRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.delivery_requests_title.tr()),
      body: const DeliveryRequestsViewBody().withPadding(
        vertical: AppSizes.h24,
        horizontal: AppSizes.w20,
      ),
    );
  }
}
