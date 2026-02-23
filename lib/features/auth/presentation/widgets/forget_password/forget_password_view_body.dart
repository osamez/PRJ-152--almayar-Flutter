part of '../../feature_imports.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AuthHeader(
          title: LocaleKeys.forget_password_title.tr(),
        ).withPadding(top: AppSizes.h56, horizontal: AppSizes.w20).toSliver,
        verticalSpace(AppSizes.h40).toSliver,
        const ForgetPasswordForm(),
      ],
    );
  }
}
