part of '../../feature_imports.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileLogoutBlocListener(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w20,
            vertical: AppSizes.h16,
          ),
          child: Column(
            children: [
              verticalSpace(AppSizes.h16),
              const ProfileAvatarSection(),
              verticalSpace(AppSizes.h24),
              ProfileMenuItem(
                iconPath: AppAssets.svgUserProfile,
                label: LocaleKeys.profile.tr(),
                onTap: () {
                  context.push(Routes.editProfile);
                },
              ),
              verticalSpace(AppSizes.h12),
              ProfileMenuItem(
                iconPath: AppAssets.svgPassword,
                label: LocaleKeys.profile_change_password.tr(),
                onTap: () {
                  context.push(Routes.changePassword);
                },
              ),
              verticalSpace(AppSizes.h12),
              ProfileMenuItem(
                iconPath: AppAssets.svgTicket,
                label: LocaleKeys.profile_support_tickets.tr(),
                onTap: () {
                  context.push(Routes.supportTickets);
                },
              ),
              verticalSpace(AppSizes.h12),
              ProfileMenuItem(
                iconPath: AppAssets.svgGift,
                label: LocaleKeys.profile_gift_cards.tr(),
                onTap: () {
                  context.push(Routes.giftCards);
                },
              ),
              verticalSpace(AppSizes.h12),
              ProfileMenuItem(
                iconPath: AppAssets.svgGavel,
                label: LocaleKeys.profile_terms_and_conditions.tr(),
                onTap: () {
                  context.push(Routes.termsAndConditions);
                },
              ),
              verticalSpace(AppSizes.h12),
              ProfileMenuItem(
                iconPath: AppAssets.svgKeyhole,
                label: LocaleKeys.profile_privacy_policy.tr(),
                onTap: () {
                  context.push(Routes.privacyPolicy);
                },
              ),
              verticalSpace(AppSizes.h12),
              ProfileMenuItem(
                iconPath: AppAssets.svgInfo,
                label: LocaleKeys.profile_about_app.tr(),
                onTap: () {
                  context.push(Routes.aboutApp);
                },
              ),
              verticalSpace(AppSizes.h12),
              ProfileMenuItem(
                iconPath: AppAssets.svgSignOut,
                label: LocaleKeys.logout.tr(),
                onTap: () => _showLogoutDialog(context),
              ),
              verticalSpace(AppSizes.h20),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) =>
          BlocProvider.value(value: cubit, child: const LogoutDialogContent()),
    );
  }
}
