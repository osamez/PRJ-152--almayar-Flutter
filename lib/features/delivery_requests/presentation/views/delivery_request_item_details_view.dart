part of '../feature_imports.dart';

class DeliveryRequestItemDetailsView extends StatelessWidget {
  const DeliveryRequestItemDetailsView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DeliveryRequestDetailsCubit>()..getDeliveryRequestDetails(id),
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.delivery_request_details_title.tr(),
        ),
        backgroundColor: AppColors.offWhite,
        body: SafeArea(child: RequestItemDetailsViewBody(id: id)),
      ),
    );
  }
}
