part of '../../feature_imports.dart';

class PriceCalculatorDeliveryBranchField extends StatelessWidget {
  const PriceCalculatorDeliveryBranchField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PriceCalculatorCubit>();
    final state = context.watch<PriceCalculatorCubit>().state;

    return CustomDropdownSearchList<AppBranchModel>(
      hintText: LocaleKeys.price_calculator_select_branch.tr(),
      items: state.deliveryBranches.valueOrNull ?? [],
      itemAsString: (item) => item.name ?? '',
      initialValue: state.selectedDeliveryBranch,
      validator: (item) => item == null ? LocaleKeys.please_select_branch.tr() : null,
      onChanged: (item) => cubit.updateDeliveryBranch(item),
    );
  }
}
