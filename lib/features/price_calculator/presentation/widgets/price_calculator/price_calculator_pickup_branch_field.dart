part of '../../feature_imports.dart';

class PriceCalculatorPickupBranchField extends StatelessWidget {
  const PriceCalculatorPickupBranchField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PriceCalculatorCubit>();
    final state = context.watch<PriceCalculatorCubit>().state;

    return CustomDropdownSearchList<AppBranchModel>(
      hintText: LocaleKeys.price_calculator_select_branch.tr(),
      items: state.receivingBranches.valueOrNull ?? [],
      itemAsString: (item) => item.name ?? '',
      initialValue: state.selectedReceivingBranch,
      validator: (value) => value == null ? LocaleKeys.please_select_branch.tr() : null,
      onChanged: (item) => cubit.updateReceivingBranch(item),
    );
  }
}
