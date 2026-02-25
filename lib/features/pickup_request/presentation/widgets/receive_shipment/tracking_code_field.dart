part of '../../feature_imports.dart';

class TrackingCodeField extends StatelessWidget {
  const TrackingCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      title: LocaleKeys.receive_shipment_tracking_code.tr(),
      hintText: LocaleKeys.receive_shipment_enter_tracking_code.tr(),
      validator: (value) => null,
    );
  }
}
