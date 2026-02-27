part of '../../feature_imports.dart';

class ClassificationField extends StatelessWidget {
  const ClassificationField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      title: LocaleKeys.receive_shipment_classification.tr(),
      hintText: LocaleKeys.receive_shipment_select_classification.tr(),
      validator: (value) => null,
      readOnly: true,
      suffixIcon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 25,
        color: AppColors.deepViolet,
      ),
    );
  }
}
