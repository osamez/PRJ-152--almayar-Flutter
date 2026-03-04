part of '../../feature_imports.dart';

class SupportTicketsAddButton extends StatelessWidget {
  const SupportTicketsAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: () {
        // TODO: Navigate to add new ticket screen
      },
      text: LocaleKeys.support_tickets_add_new.tr(),
      backgroundColor: AppColors.orange,
      iconPath: AppAssets.svgAdd,
      iconWidth: AppSizes.w20,
      iconHeight: AppSizes.h20,
    );
  }
}
