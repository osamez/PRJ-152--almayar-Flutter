part of '../feature_imports.dart';

class WalletsView extends StatelessWidget {
  const WalletsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: CustomAppBar(title: LocaleKeys.wallets_title.tr()),
      body: const WalletsViewBody().withPadding(
        vertical: AppSizes.h24,
        horizontal: AppSizes.w20,
      ),
    );
  }
}
