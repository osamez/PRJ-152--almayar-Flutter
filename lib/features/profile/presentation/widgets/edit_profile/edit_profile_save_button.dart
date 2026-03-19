part of '../../feature_imports.dart';

class EditProfileSaveButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const EditProfileSaveButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.edit_profile_save_data.tr(),
      backgroundColor: AppColors.orange,
      radius: AppSizes.radiusSm,
      onPressed: onPressed,
    );
  }
}
