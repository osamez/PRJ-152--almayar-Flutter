part of '../feature_imports.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OtpCubit()..startTimer(),
      child: const Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(child: OtpViewBody()),
      ),
    );
  }
}
