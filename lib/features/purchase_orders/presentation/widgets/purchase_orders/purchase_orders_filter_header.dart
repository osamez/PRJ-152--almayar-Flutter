part of '../../feature_imports.dart';

class PurchaseOrdersFilterHeader extends StatelessWidget {
  const PurchaseOrdersFilterHeader({super.key, required this.resultCount});

  final int resultCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.purchase_orders_filter_title.tr(),
              style: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.deepViolet,
              ),
            ),
            verticalSpace(AppSizes.h4),
            Text(
              LocaleKeys.purchase_orders_results_found.tr(
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

        CustomInkWellWidget(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const FilterPurchaseOrdersBottomSheet(),
            );
          },
          radius: 2,
          child: SvgPicture.asset(
            AppAssets.svgFilter,
            width: AppSizes.w24,
            height: AppSizes.h24,
            colorFilter: const ColorFilter.mode(
              AppColors.deepViolet,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
