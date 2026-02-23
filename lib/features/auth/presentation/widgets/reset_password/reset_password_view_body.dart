part of '../../feature_imports.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AuthHeader(
          title: LocaleKeys.reset_password_title.tr(),
        ).withPadding(top: AppSizes.h56, horizontal: AppSizes.w20).toSliver,
        verticalSpace(AppSizes.h40).toSliver,
        const ResetPasswordForm(),
      ],
    );
  }
}
