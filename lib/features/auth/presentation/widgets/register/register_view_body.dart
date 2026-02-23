part of '../../feature_imports.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Column(
          children: [
            AuthHeader(title: LocaleKeys.open_new_account.tr()),
            verticalSpace(AppSizes.h16),
            const RegisterStepIndicator(),
          ],
        ).withPadding(top: AppSizes.h56, horizontal: AppSizes.w20).toSliver,
        verticalSpace(AppSizes.h24).toSliver,
        const RegisterForm(),
      ],
    );
  }
}
