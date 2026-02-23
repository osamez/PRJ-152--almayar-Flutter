part of '../../feature_imports.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AuthHeader(
          title: LocaleKeys.otp_title.tr(),
        ).withPadding(top: AppSizes.h56, horizontal: AppSizes.w20).toSliver,
        verticalSpace(AppSizes.h40).toSliver,
        const OtpForm(),
      ],
    );
  }
}
