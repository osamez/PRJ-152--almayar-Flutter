part of '../../feature_imports.dart';

class RegisterSecondStep extends StatelessWidget {
  const RegisterSecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Column(
      children: [
        const BranchDropdown(),
        verticalSpace(AppSizes.h16),
        AppTextFormField(
          hintText: LocaleKeys.enter_email.tr(),
          onChanged: cubit.updateEmail,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return LocaleKeys.please_enter_email.tr();
            }
            if (!value.isValidEmail()) {
              return LocaleKeys.please_enter_valid_email.tr();
            }
            return null;
          },
          title: LocaleKeys.email.tr(),
          keyboardType: TextInputType.emailAddress,
        ),
        verticalSpace(AppSizes.h16),
        PhoneFormField(
          title: LocaleKeys.whatsapp_number.tr(),
          hintText: LocaleKeys.phone_hint.tr(),
          onChanged: (phone) => cubit.updateWhatsappNumber(phone),
          onCountryChanged: (code) => cubit.updateWhatsappKey(code),
        ),
        verticalSpace(AppSizes.h16),
        PasswordTextFormField(
          hintText: LocaleKeys.enter_password.tr(),
          isRequired: true,
          onChanged: cubit.updatePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return LocaleKeys.please_enter_password.tr();
            }
            if (value.length < 8) {
              return LocaleKeys.password_too_short.tr();
            }
            return null;
          },
          title: LocaleKeys.password.tr(),
        ),
        verticalSpace(AppSizes.h16),
        PasswordTextFormField(
          hintText: LocaleKeys.re_enter_password.tr(),
          isRequired: true,
          onChanged: cubit.updateConfirmPassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return LocaleKeys.please_confirm_password.tr();
            }
            if (value != cubit.state.password) {
              return LocaleKeys.passwords_not_matching.tr();
            }
            return null;
          },
          title: LocaleKeys.confirm_password.tr(),
        ),
      ],
    );
  }
}
