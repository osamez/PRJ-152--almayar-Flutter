part of '../feature_imports.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChangePasswordCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.profile_change_password.tr()),
        backgroundColor: AppColors.offWhite,
        body: const ChangePasswordViewBody().withPadding(
          vertical: AppSizes.h24,
          horizontal: AppSizes.w20,
        ),
      ),
    );
  }
}
