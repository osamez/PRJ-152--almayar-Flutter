part of '../../feature_imports.dart';

class DeliveryRequestsHeader extends StatelessWidget {
  const DeliveryRequestsHeader({super.key, required this.resultCount});

  final int resultCount;

  @override
  Widget build(BuildContext context) {
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
            namedArgs: {'count': resultCount.toString()},
          ),
          style: AppTextStyleFactory.create(
            size: 14,
            weight: FontWeight.w400,
            color: AppColors.hintColor,
          ),
        ),
      ],
    );
  }
}
