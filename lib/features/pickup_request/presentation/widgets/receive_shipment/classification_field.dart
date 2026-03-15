part of '../../feature_imports.dart';

class ClassificationField extends StatelessWidget {
  const ClassificationField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiveShipmentCubit, ReceiveShipmentState>(
      buildWhen: (p, c) =>
          p.categoriesState != c.categoriesState ||
          p.selectedCategory != c.selectedCategory,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.receive_shipment_classification.tr(),
              style: AppTextStyleFactory.create(
                size: AppSizes.h14,
                weight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            verticalSpace(AppSizes.h10),
            CustomDropdownSearchList<ShipmentCategoryModel>(
              hintText: LocaleKeys.receive_shipment_select_classification.tr(),
              items: state.categoriesState.valueOrNull ?? [],
              initialValue: state.selectedCategory,
              itemAsString: (cat) => cat.name ?? '',
              onChanged: (cat) =>
                  context.read<ReceiveShipmentCubit>().updateCategory(cat),
              validator: (value) => value == null
                  ? LocaleKeys.receive_shipment_select_classification.tr()
                  : null,
            ),
          ],
        );
      },
    );
  }
}
