part of '../../feature_imports.dart';

class BoxesAndContentsSection extends StatelessWidget {
  const BoxesAndContentsSection({
    super.key,
    required this.boxesCountController,
    required this.trackingNumberController,
  });

  final TextEditingController boxesCountController;
  final TextEditingController trackingNumberController;

  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.ideographic,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: AppTextFormField(
            controller: boxesCountController,
            title: LocaleKeys.receive_shipment_boxes_count.tr(),
            hintText: LocaleKeys.receive_shipment_enter_boxes_count.tr(),

            validator: (value) => value == null || value.trim().isEmpty
                ? LocaleKeys.receive_shipment_enter_boxes_count.tr()
                : null,
            keyboardType: TextInputType.number,
          ),
        ),
        horizontalSpace(AppSizes.w16),
        Expanded(
          flex: 1,
          child: AppTextFormField(
            controller: trackingNumberController,
            title: LocaleKeys.receive_shipment_tracking_code.tr(),
            hintText: LocaleKeys.receive_shipment_enter_tracking_code.tr(),
            validator: (value) => value == null || value.isEmpty
                ? LocaleKeys.receive_shipment_enter_tracking_code.tr()
                : null,
          ),
        ),
      ],
    );
  }
}
