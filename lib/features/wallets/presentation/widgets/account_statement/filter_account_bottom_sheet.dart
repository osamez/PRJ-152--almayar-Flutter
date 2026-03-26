part of '../../feature_imports.dart';

class FilterAccountBottomSheet extends StatefulWidget {
  const FilterAccountBottomSheet({super.key, required this.walletId});

  final int walletId;

  static void show(BuildContext context, int walletId) {
    final cubit = context.read<WalletsCubit>();
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
        child: FilterAccountBottomSheet(walletId: walletId),
      ),
    );
  }

  @override
  State<FilterAccountBottomSheet> createState() =>
      _FilterAccountBottomSheetState();
}

class _FilterAccountBottomSheetState extends State<FilterAccountBottomSheet> {
  late final TextEditingController _fromDateController;
  late final TextEditingController _toDateController;
  TransactionTypeModel? _selectedType;

  @override
  void initState() {
    super.initState();
    final state = context.read<WalletsCubit>().state;
    _fromDateController = TextEditingController(text: state.fromDate);
    _toDateController = TextEditingController(text: state.toDate);
    _selectedType = state.selectedTransactionType;
  }

  @override
  void dispose() {
    _fromDateController.dispose();
    _toDateController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(TextEditingController controller, bool isFrom) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      final dateStr =
          '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      controller.text = dateStr;
      if (isFrom) {
        context.read<WalletsCubit>().updateFromDate(dateStr);
      } else {
        context.read<WalletsCubit>().updateToDate(dateStr);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSizes.w20,
        AppSizes.h16,
        AppSizes.w20,
        MediaQuery.of(context).viewInsets.bottom + AppSizes.h32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const FilterAccountDragHandle(),
          verticalSpace(AppSizes.h24),
          Text(
            LocaleKeys.account_statement_filter_sheet_title.tr(),
            style: AppTextStyleFactory.create(
              size: 24,
              weight: FontWeight.w700,
              color: AppColors.deepViolet,
            ),
          ),
          verticalSpace(AppSizes.h24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.account_statement_filter_type.tr(),
                style: AppTextStyleFactory.create(
                  size: 14,
                  weight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              verticalSpace(AppSizes.h8),
              CustomDropdownSearchList<TransactionTypeModel>(
                items: TransactionTypeModel.all,
                initialValue: _selectedType,
                itemAsString: (item) => item.name,
                hintText: LocaleKeys.account_statement_filter_type_hint.tr(),
                onChanged: (type) {
                  setState(() {
                    _selectedType = type;
                  });
                  context.read<WalletsCubit>().updateTransactionType(type);
                },
              ),
            ],
          ),
          verticalSpace(AppSizes.h16),
          AppTextFormField(
            title: LocaleKeys.account_statement_filter_from_date.tr(),
            hintText: LocaleKeys.account_statement_filter_from_date_hint.tr(),
            readOnly: true,
            isRequired: false,
            controller: _fromDateController,
            onTap: () => _pickDate(_fromDateController, true),
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
            onTap: () => _pickDate(_toDateController, false),
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
          Row(
            children: [
              Expanded(
                child: AppElevatedButton(
                  text: LocaleKeys.cancel.tr(),
                  onPressed: () {
                    context.read<WalletsCubit>().clearFilters();
                    Navigator.pop(context);
                    context
                        .read<WalletsCubit>()
                        .getWalletTransactions(widget.walletId);
                  },
                  backgroundColor: AppColors.offWhite,
                  textColor: AppColors.orange,
                ),
              ),
              horizontalSpace(AppSizes.w16),
              Expanded(
                child: AppElevatedButton(
                  text: LocaleKeys.account_statement_filter_apply.tr(),
                  onPressed: () {
                    Navigator.pop(context);
                    context
                        .read<WalletsCubit>()
                        .getWalletTransactions(widget.walletId);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
