part of '../../feature_imports.dart';

class EditProfileSaveButton extends StatelessWidget {
  const EditProfileSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.edit_profile_save_data.tr(),
      backgroundColor: AppColors.orange,
      radius: AppSizes.radiusSm,
      onPressed: () {
        // TODO: implement save logic
      },
    );
  }
}
