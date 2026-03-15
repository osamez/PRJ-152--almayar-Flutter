import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/core/widgets/pickup_filter_option_item.dart';
import 'package:almeyar/features/pickup_request/presentation/feature_imports.dart';

class PickupFilterBottomSheet extends StatefulWidget {
  const PickupFilterBottomSheet({super.key});

  static void show(BuildContext context) {
    final cubit = context.read<ShipmentPickupRequestsCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusLg),
        ),
      ),
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: const PickupFilterBottomSheet(),
      ),
    );
  }

  @override
  State<PickupFilterBottomSheet> createState() =>
      _PickupFilterBottomSheetState();
}

class _PickupFilterBottomSheetState extends State<PickupFilterBottomSheet> {
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    final state = context.read<ShipmentPickupRequestsCubit>().state;
    if (state.flightType == null) {
      _selectedIndex = 0;
    } else if (state.flightType == 'fast') {
      _selectedIndex = 1;
    } else if (state.flightType == 'slow') {
      _selectedIndex = 2;
    }
  }

  List<String> _getFilterOptions(ShipmentType type) {
    if (type == ShipmentType.air) {
      return [
        LocaleKeys.pickup_requests_filter_all_air,
        LocaleKeys.pickup_requests_filter_express,
        LocaleKeys.pickup_requests_filter_economy,
      ];
    } else {
      return [
        LocaleKeys.pickup_requests_filter_all_sea,
        LocaleKeys.pickup_requests_filter_sea_fast,
        LocaleKeys.pickup_requests_filter_sea_slow,
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      ShipmentPickupRequestsCubit,
      ShipmentPickupRequestsState
    >(
      builder: (context, state) {
        final options = _getFilterOptions(state.shipmentType);
        return Padding(
          padding: EdgeInsets.fromLTRB(
            AppSizes.w20,
            AppSizes.h16,
            AppSizes.w20,
            AppSizes.h32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _BottomSheetDragHandle(),
              verticalSpace(AppSizes.h30),
              Text(
                LocaleKeys.pickup_requests_filter_title.tr(),
                style: AppTextStyleFactory.create(
                  size: 24,
                  weight: FontWeight.w700,
                  color: AppColors.deepViolet,
                ),
              ),
              verticalSpace(AppSizes.h50),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: options.length,
                separatorBuilder: (_, _) => verticalSpace(AppSizes.h12),
                itemBuilder: (_, index) => PickupFilterOptionItem(
                  label: options[index].tr(),
                  isSelected: _selectedIndex == index,
                  onTap: () => setState(() => _selectedIndex = index),
                ),
              ),
              verticalSpace(AppSizes.h24),
              AppElevatedButton(
                text: LocaleKeys.pickup_requests_filter_apply.tr(),
                onPressed: () {
                  String? flightType;
                  if (_selectedIndex == 1) {
                    flightType = 'fast';
                  } else if (_selectedIndex == 2) {
                    flightType = 'slow';
                  }
                  context
                      .read<ShipmentPickupRequestsCubit>()
                      .applyFlightTypeFilter(flightType);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BottomSheetDragHandle extends StatelessWidget {
  const _BottomSheetDragHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: AppSizes.w82,
        height: AppSizes.h8,
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(AppSizes.radiusXxxl),
        ),
      ),
    );
  }
}
