part of '../../feature_imports.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AuthHeader(
          title: LocaleKeys.please_login.tr(),
        ).withPadding(top: AppSizes.h56, horizontal: AppSizes.w20).toSliver,
        verticalSpace(AppSizes.h40).toSliver,
        const LoginForm(),
      ],
    );
  }
}
