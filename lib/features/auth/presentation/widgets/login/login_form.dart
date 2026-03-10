part of '../../feature_imports.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final ValueNotifier<String> _selectedCountryCode = ValueNotifier('+218');

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _selectedCountryCode.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (!_formKey.currentState!.validate()) return;

    context.read<AuthCubit>().login(
      LoginRequest(
        whatsappNumber: _phoneController.text.trim(),
        whatsappKey: _selectedCountryCode.value,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w20,
            vertical: AppSizes.h56,
          ),
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSizes.radiusLg),
            ),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                textBaseline: TextBaseline.alphabetic,
                spacing: AppSizes.w4,
                children: [
                  Expanded(
                    child: PhoneFormField(
                      onCountryChanged: (code) {
                        _selectedCountryCode.value = code;
                      },
                      controller: _phoneController,
                      hintText: LocaleKeys.enter_phone_number.tr(),
                      title: LocaleKeys.phone_number.tr(),
                    ),
                  ),
                ],
              ),
              verticalSpace(AppSizes.h16),
              PasswordTextFormField(
                controller: _passwordController,
                hintText: LocaleKeys.password_hint.tr(),
                showResetPassword: true,
                isRequired: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return LocaleKeys.password_required.tr();
                  }
                  if (value.length < 6) {
                    return LocaleKeys.password_too_short.tr();
                  }
                  return null;
                },
                title: LocaleKeys.password.tr(),
              ),
              verticalSpace(AppSizes.h36),
              AppElevatedButton(
                onPressed: _onLoginPressed,
                text: LocaleKeys.login.tr(),
              ),
              verticalSpace(AppSizes.h16),
              Text(
                LocaleKeys.no_account.tr(),
                style: AppTextStyleFactory.create(
                  size: 13,
                  weight: FontWeight.w400,
                  color: AppColors.lightHeadingText,
                ),
              ).center,
              verticalSpace(AppSizes.h16),
              AppElevatedButton(
                onPressed: () {
                  context.push(Routes.register);
                },
                text: LocaleKeys.create_new_account.tr(),
                textColor: AppColors.deepViolet,
                backgroundColor: const Color(0xff3A2A85).withValues(alpha: 0.3),
              ),
              const LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
