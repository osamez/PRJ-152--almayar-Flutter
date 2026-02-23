part of '../../feature_imports.dart';

class OtpTimerText extends StatelessWidget {
  const OtpTimerText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpCubit, OtpState>(
      buildWhen: (previous, current) =>
          previous.remainingSeconds != current.remainingSeconds ||
          previous.canResend != current.canResend,
      builder: (context, state) {
        final cubit = context.read<OtpCubit>();

        if (state.canResend) {
          return GestureDetector(
            onTap: cubit.resendOtp,
            child: Text(
              LocaleKeys.resend_code.tr(),
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w500,
                color: AppColors.deepViolet,
              ),
            ),
          ).center;
        }

        return Text(
          LocaleKeys.resend_after.tr(namedArgs: {'time': cubit.formattedTime}),
          style: AppTextStyleFactory.create(
            size: 14,
            weight: FontWeight.w400,
            color: AppColors.lightSmallText,
          ),
        ).center;
      },
    );
  }
}
