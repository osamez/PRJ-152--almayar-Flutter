part of '../../feature_imports.dart';

class RegisterSecondStep extends StatelessWidget {
  const RegisterSecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: LocaleKeys.preferred_branch_hint.tr(),
          validator: (value) {},
          title: LocaleKeys.preferred_branch.tr(),
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.black,
          ),
        ),
        verticalSpace(AppSizes.h16),
        AppTextFormField(
          hintText: LocaleKeys.enter_email.tr(),
          validator: (value) {},
          title: LocaleKeys.email.tr(),
          keyboardType: TextInputType.emailAddress,
        ),
        verticalSpace(AppSizes.h16),
        PhoneFormField(
          title: LocaleKeys.whatsapp_number.tr(),
          hintText: LocaleKeys.phone_hint.tr(),
        ),
        verticalSpace(AppSizes.h16),
        PasswordTextFormField(
          hintText: LocaleKeys.enter_password.tr(),
          isRequired: true,
          validator: (value) {},
          title: LocaleKeys.password.tr(),
        ),
        verticalSpace(AppSizes.h16),
        PasswordTextFormField(
          hintText: LocaleKeys.re_enter_password.tr(),
          isRequired: true,
          validator: (value) {},
          title: LocaleKeys.confirm_password.tr(),
        ),
      ],
    );
  }
}
