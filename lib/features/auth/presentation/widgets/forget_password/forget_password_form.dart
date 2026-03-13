part of '../../feature_imports.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final ValueNotifier<String> _selectedCountryCode = ValueNotifier('+218');

  @override
  void dispose() {
    _phoneController.dispose();
    _selectedCountryCode.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<OtpCubit>().sendOtp(
      SendOtpRequest(
        whatsappNumber: _phoneController.text.trim().substring(1),
        whatsappKey: _selectedCountryCode.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const ForgetPasswordBlocListener(),
              PhoneFormField(
                onCountryChanged: (code) {
                  _selectedCountryCode.value = code;
                },
                title: LocaleKeys.phone_number.tr(),
                hintText: LocaleKeys.enter_phone_number.tr(),
                controller: _phoneController,
              ),
              verticalSpace(AppSizes.h36),
              AppElevatedButton(
                onPressed: _onSubmit,
                text: LocaleKeys.request_verification_code.tr(),
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
                backgroundColor: const Color(0xff3a2a85).withValues(alpha: 0.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
