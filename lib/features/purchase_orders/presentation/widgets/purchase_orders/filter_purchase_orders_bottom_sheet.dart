part of '../../feature_imports.dart';

class FilterPurchaseOrdersBottomSheet extends StatefulWidget {
  const FilterPurchaseOrdersBottomSheet({super.key});

  @override
  State<FilterPurchaseOrdersBottomSheet> createState() =>
      _FilterPurchaseOrdersBottomSheetState();
}

class _FilterPurchaseOrdersBottomSheetState
    extends State<FilterPurchaseOrdersBottomSheet> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.h12,
        left: AppSizes.w20,
        right: AppSizes.w20,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSizes.h20,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusLg),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(AppSizes.h12),
          _buildDragHandle(),
          verticalSpace(AppSizes.h16),
          Text(
            LocaleKeys.purchase_orders_filter_title.tr(),
            style: AppTextStyleFactory.create(
              size: 24,
              weight: FontWeight.w700,
              color: AppColors.deepViolet,
            ),
          ),
          verticalSpace(AppSizes.h50),
          Column(
            children: [
              FilterPurchaseOrderOption(
                label: LocaleKeys.purchase_orders_all_orders.tr(),
                isSelected: _selectedIndex == 0,
                onTap: () => setState(() => _selectedIndex = 0),
              ),
              verticalSpace(AppSizes.h12),
              FilterPurchaseOrderOption(
                label: LocaleKeys.purchase_orders_under_review.tr(),
                isSelected: _selectedIndex == 1,
                onTap: () => setState(() => _selectedIndex = 1),
              ),
              verticalSpace(AppSizes.h12),
              FilterPurchaseOrderOption(
                label: LocaleKeys.purchase_orders_in_progress.tr(),
                isSelected: _selectedIndex == 2,
                onTap: () => setState(() => _selectedIndex = 2),
              ),
              verticalSpace(AppSizes.h12),
              FilterPurchaseOrderOption(
                label: LocaleKeys.purchase_orders_purchased.tr(),
                isSelected: _selectedIndex == 3,
                onTap: () => setState(() => _selectedIndex = 3),
              ),
            ],
          ),
          verticalSpace(AppSizes.h24),
          AppElevatedButton(
            text: LocaleKeys.purchase_orders_filter_apply.tr(),
            onPressed: () => context.pop(_selectedIndex),
          ),
          verticalSpace(AppSizes.h30),
        ],
      ),
    );
  }

  Widget _buildDragHandle() {
    return Container(
      width: AppSizes.w82,
      height: AppSizes.h8,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(AppSizes.radiusXs),
      ),
    );
  }
}
