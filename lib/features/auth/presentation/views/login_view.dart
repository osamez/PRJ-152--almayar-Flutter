part of '../feature_imports.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: const Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(child: LoginViewBody()),
      ),
    );
  }
}
