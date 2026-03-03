part of '../../feature_imports.dart';

class ChangePasswordSaveButton extends StatelessWidget {
  const ChangePasswordSaveButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      text: LocaleKeys.change_password_save.tr(),
      backgroundColor: AppColors.orange,
      radius: AppSizes.radiusSm,
      onPressed: onPressed,
    );
  }
}
