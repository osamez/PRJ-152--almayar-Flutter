part of '../../feature_imports.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key, required this.otpParams});
  final OtpParams otpParams;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AuthHeader(
          title: LocaleKeys.otp_title.tr(),
        ).withPadding(top: AppSizes.h56, horizontal: AppSizes.w20).toSliver,
        verticalSpace(AppSizes.h40).toSliver,
        OtpForm(otpParams: otpParams),
      ],
    );
  }
}
