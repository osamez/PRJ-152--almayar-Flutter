part of '../feature_imports.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key, required this.otpParams});
  final OtpParams otpParams;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OtpCubit>()..startTimer(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(child: OtpViewBody(otpParams: otpParams)),
      ),
    );
  }
}

class OtpParams {
  final String phone;
  final String phoneKey;

  OtpParams({required this.phone, required this.phoneKey});
}
