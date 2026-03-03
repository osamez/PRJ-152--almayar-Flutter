part of '../feature_imports.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.profile_terms_and_conditions.tr()),
      backgroundColor: AppColors.offWhite,
      body: const TermsAndConditionsViewBody(),
    );
  }
}
