part of '../../feature_imports.dart';

class PickupFilterHeader extends StatelessWidget {
  const PickupFilterHeader({super.key, required this.resultCount});

  final int resultCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.pickup_requests_filter_title.tr(),
              style: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.darkSlate,
              ),
            ),
            verticalSpace(AppSizes.h4),
            Text(
              LocaleKeys.pickup_requests_results_found.tr(
                namedArgs: {'count': resultCount.toString()},
              ),
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w400,
                color: AppColors.hintColor,
              ),
            ),
          ],
        ),
        const Spacer(),

        SvgPicture.asset(AppAssets.svgFilter),
      ],
    );
  }
}
