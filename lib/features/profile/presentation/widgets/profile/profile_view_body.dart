part of '../../feature_imports.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              onTap: () {},
            ),
            verticalSpace(AppSizes.h12),
            ProfileMenuItem(
              iconPath: AppAssets.svgPassword,
              label: LocaleKeys.profile_change_password.tr(),
              onTap: () {},
            ),
            verticalSpace(AppSizes.h12),
            ProfileMenuItem(
              iconPath: AppAssets.svgTicket,
              label: LocaleKeys.profile_support_tickets.tr(),
              onTap: () {},
            ),
            verticalSpace(AppSizes.h12),
            ProfileMenuItem(
              iconPath: AppAssets.svgGift,
              label: LocaleKeys.profile_gift_cards.tr(),
              onTap: () {},
            ),
            verticalSpace(AppSizes.h12),
            ProfileMenuItem(
              iconPath: AppAssets.svgGavel,
              label: LocaleKeys.profile_terms_and_conditions.tr(),
              onTap: () {},
            ),
            verticalSpace(AppSizes.h12),
            ProfileMenuItem(
              iconPath: AppAssets.svgKeyhole,
              label: LocaleKeys.profile_privacy_policy.tr(),
              onTap: () {},
            ),
            verticalSpace(AppSizes.h12),
            ProfileMenuItem(
              iconPath: AppAssets.svgInfo,
              label: LocaleKeys.profile_about_app.tr(),
              onTap: () {},
            ),
            verticalSpace(AppSizes.h12),
            ProfileMenuItem(
              iconPath: AppAssets.svgSignOut,
              label: LocaleKeys.logout.tr(),
              onTap: () {},
            ),
            verticalSpace(AppSizes.h20),
          ],
        ),
      ),
    );
  }
}
