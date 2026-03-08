part of '../../feature_imports.dart';

class ConfirmTransferTimerText extends StatelessWidget {
  const ConfirmTransferTimerText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmTransferCubit, ConfirmTransferState>(
      buildWhen: (previous, current) =>
          previous.remainingSeconds != current.remainingSeconds ||
          previous.canResend != current.canResend,
      builder: (context, state) {
        final cubit = context.read<ConfirmTransferCubit>();

        if (state.canResend) {
          return GestureDetector(
            onTap: cubit.resendOtp,
            child: Text(
              LocaleKeys.confirm_transfer_resend.tr(),
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w500,
                color: AppColors.deepViolet,
              ),
            ),
          ).center;
        }

        return Text(
          LocaleKeys.confirm_transfer_resend_after.tr(
            namedArgs: {'time': cubit.formattedTime},
          ),
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
