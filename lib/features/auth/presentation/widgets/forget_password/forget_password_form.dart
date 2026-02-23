part of '../../feature_imports.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w20,
          vertical: AppSizes.h56,
        ),
        decoration: BoxDecoration(
          color: AppColors.offWhite,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSizes.radiusLg),
          ),
        ),
        child: Column(
          children: [
            PhoneFormField(
              title: LocaleKeys.phone_number.tr(),
              hintText: LocaleKeys.enter_phone_number.tr(),
            ),

            verticalSpace(AppSizes.h36),
            AppElevatedButton(
              onPressed: () {},
              text: LocaleKeys.request_verification_code.tr(),
            ),
            verticalSpace(AppSizes.h16),
            Text(
              LocaleKeys.already_have_account.tr(),
              style: AppTextStyleFactory.create(
                size: 13,
                weight: FontWeight.w400,
                color: AppColors.lightHeadingText,
              ),
            ).center,
            verticalSpace(AppSizes.h16),
            AppElevatedButton(
              onPressed: () {
                context.go(Routes.login);
              },
              text: LocaleKeys.login.tr(),
              textColor: AppColors.deepViolet,
              backgroundColor: const Color(0xff3a2a85).withValues(alpha: 0.3),
            ),
          ],
        ),
      ),
    );
  }
}
