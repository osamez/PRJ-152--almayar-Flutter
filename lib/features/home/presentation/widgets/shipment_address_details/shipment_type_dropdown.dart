part of '../../feature_imports.dart';

class ShipmentTypeDropdown extends StatelessWidget {
  const ShipmentTypeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      isRequired: false,
      hintText: LocaleKeys.shipment_details_select_shipping_type.tr(),
      title: LocaleKeys.shipment_details_shipping_type.tr(),
      titleColor: AppColors.lightHeadingText,
      validator: (value) {},
      suffixIcon: Icon(
        Icons.keyboard_arrow_down_rounded,
        size: AppSizes.w24,
        color: AppColors.deepViolet,
      ),
    );
  }
}
