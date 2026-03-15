part of '../../feature_imports.dart';

class WeightVolumeSection extends StatelessWidget {
  const WeightVolumeSection({
    super.key,
    required this.volumeController,
    required this.weightController,
  });

  final TextEditingController volumeController;
  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextFormField(
            controller: volumeController,
            title: LocaleKeys.receive_shipment_total_volume.tr(),
            hintText: LocaleKeys.receive_shipment_enter_total_volume.tr(),
            validator: (value) =>
                value == null || value.isEmpty ? LocaleKeys.receive_shipment_enter_total_volume.tr() : null,
            keyboardType: TextInputType.number,
          ),
        ),
        horizontalSpace(AppSizes.w16),
        Expanded(
          child: AppTextFormField(
            controller: weightController,
            title: LocaleKeys.receive_shipment_total_weight.tr(),
            hintText: LocaleKeys.receive_shipment_enter_total_weight.tr(),
            validator: (value) =>
                value == null || value.isEmpty ? LocaleKeys.receive_shipment_enter_total_weight.tr() : null,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
