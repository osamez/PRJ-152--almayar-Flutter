part of '../../feature_imports.dart';

class PriceCalculatorClassificationField extends StatelessWidget {
  const PriceCalculatorClassificationField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PriceCalculatorCubit>();
    final state = context.watch<PriceCalculatorCubit>().state;

    return CustomDropdownSearchList<ShipmentCategoryModel>(
      hintText: LocaleKeys.price_calculator_select_classification.tr(),
      items: state.shipmentCategories.valueOrNull ?? [],
      itemAsString: (item) => item.name ?? '',
      initialValue: state.selectedCategory,
      validator: (item) => item == null ? LocaleKeys.price_calculator_select_classification.tr() : null,
      onChanged: (item) => cubit.updateCategory(item),
    );
  }
}
