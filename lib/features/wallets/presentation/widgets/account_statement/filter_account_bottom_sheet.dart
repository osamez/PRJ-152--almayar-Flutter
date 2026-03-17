part of '../../feature_imports.dart';

class FilterAccountBottomSheet extends StatefulWidget {
  const FilterAccountBottomSheet({super.key});

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
      builder: (_) => const FilterAccountBottomSheet(),
    );
  }

  @override
  State<FilterAccountBottomSheet> createState() =>
      _FilterAccountBottomSheetState();
}

class _FilterAccountBottomSheetState extends State<FilterAccountBottomSheet> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  @override
  void dispose() {
    _fromDateController.dispose();
    _toDateController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      controller.text =
          '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
    }
  }

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
          const FilterAccountDragHandle(),
          verticalSpace(AppSizes.h24),
          Text(
            LocaleKeys.account_statement_filter_sheet_title.tr(),
            style: AppTextStyleFactory.create(
              size: AppSizes.h24,
              weight: FontWeight.w700,
              color: AppColors.deepViolet,
            ),
          ),
          verticalSpace(AppSizes.h24),
          AppTextFormField(
            title: LocaleKeys.account_statement_filter_type.tr(),
            hintText: LocaleKeys.account_statement_filter_type_hint.tr(),
            readOnly: true,
            isRequired: false,
            validator: (_) => null,
            suffixIcon: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: AppSizes.w24,
              color: AppColors.darkText,
            ),
          ),
          verticalSpace(AppSizes.h16),
          AppTextFormField(
            title: LocaleKeys.account_statement_filter_from_date.tr(),
            hintText: LocaleKeys.account_statement_filter_from_date_hint.tr(),
            readOnly: true,
            isRequired: false,
            controller: _fromDateController,
            onTap: () => _pickDate(_fromDateController),
            validator: (_) => null,
            suffixIcon: Padding(
              padding: EdgeInsets.all(AppSizes.w12),
              child: SvgPicture.asset(
                AppAssets.svgCalendar,
                width: AppSizes.w20,
                height: AppSizes.h20,
                colorFilter: const ColorFilter.mode(
                  AppColors.darkText,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          verticalSpace(AppSizes.h16),
          AppTextFormField(
            title: LocaleKeys.account_statement_filter_to_date.tr(),
            hintText: LocaleKeys.account_statement_filter_to_date_hint.tr(),
            readOnly: true,
            isRequired: false,
            controller: _toDateController,
            onTap: () => _pickDate(_toDateController),
            validator: (_) => null,
            suffixIcon: Padding(
              padding: EdgeInsets.all(AppSizes.w12),
              child: SvgPicture.asset(
                AppAssets.svgCalendar,
                width: AppSizes.w20,
                height: AppSizes.h20,
                colorFilter: const ColorFilter.mode(
                  AppColors.darkText,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          verticalSpace(AppSizes.h24),
          AppElevatedButton(
            text: LocaleKeys.account_statement_filter_apply.tr(),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
