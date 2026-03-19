part of '../../feature_imports.dart';

class EditProfileInfoCard extends StatelessWidget {
  final ProfileModel profile;
  const EditProfileInfoCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return DetailsInfoCardSection(
      rows: [
        DetailsInfoRowData(
          label: LocaleKeys.edit_profile_name.tr(),
          value: profile.name ?? '',
        ),
        DetailsInfoRowData(
          label: LocaleKeys.edit_profile_code.tr(),
          value: profile.code ?? '',
        ),
        DetailsInfoRowData(
          label: LocaleKeys.edit_profile_country.tr(),
          value: profile.branch?.countryName ?? '',
        ),
        DetailsInfoRowData(
          label: LocaleKeys.edit_profile_city.tr(),
          value: profile.branch?.cityName ?? '',
        ),
        DetailsInfoRowData(
          label: LocaleKeys.edit_profile_phone.tr(),
          value:
              '${profile.phone?.number ?? ''} \u200E${profile.phone?.key ?? ''}',
        ),
        DetailsInfoRowData(
          label: LocaleKeys.edit_profile_whatsapp.tr(),
          value:
              '${profile.whatsapp?.number ?? ''} \u200E${profile.whatsapp?.key ?? ''}',
        ),
      ],
    );
  }
}
