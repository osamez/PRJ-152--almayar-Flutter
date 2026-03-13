part of '../../feature_imports.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key, required this.params});
  final ResetPasswordParams params;

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
      context.read<ResetPasswordCubit>().resetPassword(
        ResetPasswordRequest(
          whatsappKey: widget.params.phoneKey,
          whatsappNumber: widget.params.phone,
          otp: widget.params.otp,
          password: _passwordController.text,
          passwordConfirmation: _confirmPasswordController.text,
        ),
      );
    }
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
              const ResetPasswordBlocListener(),
              PasswordTextFormField(
                controller: _passwordController,
                title: LocaleKeys.password.tr(),
                hintText: LocaleKeys.enter_password.tr(),
                isRequired: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
              verticalSpace(AppSizes.h16),
              PasswordTextFormField(
                controller: _confirmPasswordController,
                title: LocaleKeys.confirm_password.tr(),
                hintText: LocaleKeys.re_enter_password.tr(),
                isRequired: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  if (value != _passwordController.text) {
                    return LocaleKeys.passwords_not_matching.tr();
                  }
                  return null;
                },
              ),
              verticalSpace(AppSizes.h36),
              AppElevatedButton(
                onPressed: _onSubmit,
                text: LocaleKeys.save_and_set_password.tr(),
              ),
              verticalSpace(AppSizes.h16),
              Text(
                LocaleKeys.already_have_account.tr(),
                style: AppTextStyleFactory.create(
                  size: 13,
                  weight: FontWeight.w400,
                  color: AppColors.lightHeadingText,
                ),
              ).center,
              verticalSpace(AppSizes.h16),
              AppElevatedButton(
                onPressed: () {
                  context.go(Routes.login);
                },
                text: LocaleKeys.login.tr(),
                textColor: AppColors.deepViolet,
                backgroundColor: const Color(0xff3A2A85).withValues(alpha: 0.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
