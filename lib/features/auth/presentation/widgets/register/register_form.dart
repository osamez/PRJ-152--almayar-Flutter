part of '../../feature_imports.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

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
              RegisterStepContent(formKey: _formKey),
              verticalSpace(AppSizes.h32),
              RegisterNextButton(formKey: _formKey),
            ],
          ),
        ),
      ),
    );
  }
}
