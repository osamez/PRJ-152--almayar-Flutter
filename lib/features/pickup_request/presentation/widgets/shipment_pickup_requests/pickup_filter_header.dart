part of '../../feature_imports.dart';

class PickupFilterHeader extends StatelessWidget {
  const PickupFilterHeader({super.key});

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
            BlocBuilder<ShipmentPickupRequestsCubit,
                ShipmentPickupRequestsState>(
              buildWhen: (previous, current) =>
                  previous.getShipmentRequestsState !=
                  current.getShipmentRequestsState,
              builder: (context, state) {
                final resultCount =
                    state.getShipmentRequestsState.valueOrNull?.meta?.total ??
                        0;
                return Text(
                  LocaleKeys.pickup_requests_results_found.tr(
                    namedArgs: {'count': resultCount.toString()},
                  ),
                  style: AppTextStyleFactory.create(
                    size: 14,
                    weight: FontWeight.w400,
                    color: AppColors.hintColor,
                  ),
                );
              },
            ),
          ],
        ),
        const Spacer(),
        Skeleton.ignore(
          child: CustomInkWellWidget(
            onTap: () => PickupFilterBottomSheet.show(context),
            radius: 12,
            padding: const EdgeInsets.all(2),
            child: SvgPicture.asset(AppAssets.svgFilter),
          ),
        ),
      ],
    );
  }
}
