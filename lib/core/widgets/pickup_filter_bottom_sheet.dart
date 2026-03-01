import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/core/widgets/pickup_filter_option_item.dart';

class PickupFilterBottomSheet extends StatefulWidget {
  const PickupFilterBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusLg),
        ),
      ),
      builder: (_) => const PickupFilterBottomSheet(),
    );
  }

  @override
  State<PickupFilterBottomSheet> createState() =>
      _PickupFilterBottomSheetState();
}

class _PickupFilterBottomSheetState extends State<PickupFilterBottomSheet> {
  int? _selectedIndex;

  static final List<String> _filterOptions = [
    LocaleKeys.pickup_requests_filter_all_air,
    LocaleKeys.pickup_requests_filter_economy,
    LocaleKeys.pickup_requests_filter_express,
  ];

  @override
  Widget build(BuildContext context) {
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
            itemCount: _filterOptions.length,
            separatorBuilder: (_, _) => verticalSpace(AppSizes.h12),
            itemBuilder: (_, index) => PickupFilterOptionItem(
              label: _filterOptions[index].tr(),
              isSelected: _selectedIndex == index,
              onTap: () => setState(() => _selectedIndex = index),
            ),
          ),
          verticalSpace(AppSizes.h24),
          AppElevatedButton(
            text: LocaleKeys.pickup_requests_filter_apply.tr(),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
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
