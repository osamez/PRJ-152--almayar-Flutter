part of '../../feature_imports.dart';

class FilterPurchaseOrdersBottomSheet extends StatefulWidget {
  const FilterPurchaseOrdersBottomSheet({super.key, this.selectedStatusId});

  final int? selectedStatusId;

  @override
  State<FilterPurchaseOrdersBottomSheet> createState() =>
      _FilterPurchaseOrdersBottomSheetState();
}

class _FilterPurchaseOrdersBottomSheetState
    extends State<FilterPurchaseOrdersBottomSheet> {
  late int? _selectedStatusId;

  @override
  void initState() {
    super.initState();
    _selectedStatusId = widget.selectedStatusId;
  }

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
                isSelected: _selectedStatusId == null,
                onTap: () => setState(() => _selectedStatusId = null),
              ),
              verticalSpace(AppSizes.h12),
              FilterPurchaseOrderOption(
                label: PurchaseStatus.pending.label,
                isSelected: _selectedStatusId == PurchaseStatus.pending.id,
                onTap: () => setState(() => _selectedStatusId = PurchaseStatus.pending.id),
              ),
              verticalSpace(AppSizes.h12),
              FilterPurchaseOrderOption(
                label: PurchaseStatus.inProgress.label,
                isSelected: _selectedStatusId == PurchaseStatus.inProgress.id,
                onTap: () => setState(() => _selectedStatusId = PurchaseStatus.inProgress.id),
              ),
              verticalSpace(AppSizes.h12),
              FilterPurchaseOrderOption(
                label: PurchaseStatus.purchased.label,
                isSelected: _selectedStatusId == PurchaseStatus.purchased.id,
                onTap: () => setState(() => _selectedStatusId = PurchaseStatus.purchased.id),
              ),
              verticalSpace(AppSizes.h12),
              FilterPurchaseOrderOption(
                label: PurchaseStatus.cancelled.label,
                isSelected: _selectedStatusId == PurchaseStatus.cancelled.id,
                onTap: () => setState(() => _selectedStatusId = PurchaseStatus.cancelled.id),
              ),
            ],
          ),
          verticalSpace(AppSizes.h24),
          AppElevatedButton(
            text: LocaleKeys.purchase_orders_filter_apply.tr(),
            onPressed: () => context.pop(_selectedStatusId),
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
