part of '../feature_imports.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.params});

  final ResetPasswordParams params;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResetPasswordCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(child: ResetPasswordViewBody(params: params)),
      ),
    );
  }
}

class ResetPasswordParams {
  final String phone;
  final String phoneKey;
  final String otp;

  ResetPasswordParams({
    required this.phone,
    required this.phoneKey,
    required this.otp,
  });
}
