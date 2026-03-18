part of '../../feature_imports.dart';

class DeliveryRequestsHeader extends StatelessWidget {
  const DeliveryRequestsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryRequestsCubit, DeliveryRequestsState>(
      buildWhen: (previous, current) =>
          previous.getDeliveryRequestsOrdersState !=
          current.getDeliveryRequestsOrdersState,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.delivery_requests_title.tr(),
              style: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.deepViolet,
              ),
            ),
            verticalSpace(AppSizes.h4),
            Text(
              LocaleKeys.delivery_requests_results_found.tr(
                namedArgs: {
                  'count': state.deliveryRequestsOrdersList.length.toString(),
                },
              ),
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w400,
                color: AppColors.hintColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
