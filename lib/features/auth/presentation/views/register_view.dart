part of '../feature_imports.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(ImagePickerService()),
      child: const Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(child: RegisterViewBody()),
      ),
    );
  }
}
