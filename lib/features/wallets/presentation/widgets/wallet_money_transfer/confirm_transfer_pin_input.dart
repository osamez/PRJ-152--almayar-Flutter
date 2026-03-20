part of '../../feature_imports.dart';

class ConfirmTransferPinInput extends StatelessWidget {
  const ConfirmTransferPinInput({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: AppSizes.w50,
      height: AppSizes.h50,
      textStyle: AppTextStyleFactory.create(
        size: 20,
        weight: FontWeight.w600,
        color: AppColors.darkBlueText,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        border: Border.all(color: AppColors.gray),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: AppColors.deepViolet, width: 2),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: AppColors.error500, width: 2),
      ),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        length: 6,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        errorPinTheme: errorPinTheme,
        separatorBuilder: (index) => horizontalSpace(AppSizes.w8),
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onChanged: (value) {
          context.read<WalletMoneyTransferCubit>().onOtpChanged(value);
        },
        validator: (value) {
          if (value == null || value.length < 6) {
            return LocaleKeys.otp_validation_error.tr();
          }
          return null;
        },
        onCompleted: (value) {
          context.read<WalletMoneyTransferCubit>().onOtpChanged(value);
        },
      ),
    );
  }
}
