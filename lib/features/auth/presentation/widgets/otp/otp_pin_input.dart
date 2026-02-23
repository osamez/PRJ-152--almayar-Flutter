part of '../../feature_imports.dart';

class OtpPinInput extends StatelessWidget {
  const OtpPinInput({super.key});

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

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        length: 6,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        separatorBuilder: (index) => horizontalSpace(AppSizes.w8),
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onChanged: (value) {
          context.read<OtpCubit>().onOtpChanged(value);
        },
        onCompleted: (value) {
          context.read<OtpCubit>().onOtpChanged(value);
        },
      ),
    );
  }
}
