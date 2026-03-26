part of '../../feature_imports.dart';

class RegisterSecondStep extends StatefulWidget {
  const RegisterSecondStep({super.key});

  @override
  State<RegisterSecondStep> createState() => _RegisterSecondStepState();
}

class _RegisterSecondStepState extends State<RegisterSecondStep> {
  late final TextEditingController _emailController;
  late final TextEditingController _whatsappController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<RegisterCubit>();
    _emailController = TextEditingController(text: cubit.state.email);
    _whatsappController =
        TextEditingController(text: cubit.state.whatsappNumber);
    _passwordController = TextEditingController(text: cubit.state.password);
    _confirmPasswordController =
        TextEditingController(text: cubit.state.confirmPassword);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _whatsappController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Column(
      children: [
        const BranchDropdown(),
        verticalSpace(AppSizes.h16),
        AppTextFormField(
          controller: _emailController,
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
          controller: _whatsappController,
          title: LocaleKeys.whatsapp_number.tr(),
          hintText: LocaleKeys.phone_hint.tr(),
          initialCountryCode: cubit.state.whatsappKey,
          onChanged: (phone) => cubit.updateWhatsappNumber(phone),
          onCountryChanged: (code) => cubit.updateWhatsappKey(code),
        ),
        verticalSpace(AppSizes.h16),
        PasswordTextFormField(
          controller: _passwordController,
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
          controller: _confirmPasswordController,
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
