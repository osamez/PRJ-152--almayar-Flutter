part of '../../feature_imports.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _showMismatchError = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    final passwordsMatch =
        _passwordController.text == _confirmPasswordController.text;

    setState(() {
      _showMismatchError = !passwordsMatch;
    });

    if (isValid && passwordsMatch) {
      // TODO: call reset password cubit
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
                  return null;
                },
              ),
              if (_showMismatchError) ...[
                verticalSpace(AppSizes.h8),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    LocaleKeys.passwords_not_matching.tr(),
                    style: AppTextStyleFactory.create(
                      size: 13,
                      weight: FontWeight.w400,
                      color: AppColors.orange,
                    ),
                  ),
                ),
              ],
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
