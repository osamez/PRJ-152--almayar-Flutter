part of '../../feature_imports.dart';

class InspectionNoteField extends StatelessWidget {
  const InspectionNoteField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      title: LocaleKeys.receive_shipment_inspection_note.tr(),
      hintText: LocaleKeys.receive_shipment_note_hint.tr(),
      validator: (value) => null,
      maxLines: 6,
    );
  }
}
