part of '../feature_imports.dart';

class AppInfoView extends StatelessWidget {
  final AppInfoType type;
  const AppInfoView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppInfoCubit>()..getAppInfo(type),
      child: Scaffold(
        appBar: CustomAppBar(title: _getTitle().tr()),
        backgroundColor: AppColors.offWhite,
        body: const AppInfoViewBody(),
      ),
    );
  }

  String _getTitle() {
    return switch (type) {
      AppInfoType.privacyPolicy => LocaleKeys.profile_privacy_policy,
      AppInfoType.aboutApp => LocaleKeys.profile_about_app,
      AppInfoType.termsAndConditions => LocaleKeys.profile_terms_and_conditions,
    };
  }
}
