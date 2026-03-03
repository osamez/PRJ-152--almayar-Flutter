part of '../../feature_imports.dart';

class EditProfileInfoCard extends StatelessWidget {
  const EditProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DetailsInfoCardSection(
      rows: [
        DetailsInfoRowData(
          label: LocaleKeys.edit_profile_name.tr(),
          value: 'أسامة مصطفى المرغني الجميل',
        ),
        DetailsInfoRowData(
          label: LocaleKeys.edit_profile_code.tr(),
          value: '2515-TIP',
        ),
        DetailsInfoRowData(
          label: LocaleKeys.edit_profile_country.tr(),
          value: 'ليبيا',
        ),
        DetailsInfoRowData(
          label: LocaleKeys.edit_profile_city.tr(),
          value: 'طرابلس',
        ),
        DetailsInfoRowData(
          label: LocaleKeys.edit_profile_phone.tr(),
          value: '+218 91 123 4567',
        ),
        DetailsInfoRowData(
          label: LocaleKeys.edit_profile_whatsapp.tr(),
          value: '+218 91 123 4567',
        ),
      ],
    );
  }
}
