part of '../../feature_imports.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              textBaseline: TextBaseline.alphabetic,
              spacing: AppSizes.w4,
              children: [
                Expanded(
                  child: AppTextFormField(
                    hintText: LocaleKeys.enter_phone_number.tr(),
                    validator: (value) {},
                    title: LocaleKeys.phone_number.tr(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.w12,
                    vertical: AppSizes.h12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    border: Border.all(color: AppColors.gray),
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.country_code.tr(),
                      style: AppTextStyleFactory.create(
                        size: 14,
                        weight: FontWeight.w300,
                        color: AppColors.darkBlueText,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(AppSizes.h16),
            AppTextFormField(
              hintText: LocaleKeys.password_hint.tr(),
              showResetPassword: true,
              validator: (value) {},
              suffixIcon: const Icon(Icons.visibility_off_outlined),
              title: LocaleKeys.password.tr(),
            ),
            verticalSpace(AppSizes.h36),
            AppElevatedButton(
              onPressed: () {
                context.push(Routes.main);
              },
              text: LocaleKeys.login.tr(),
            ),
            verticalSpace(AppSizes.h16),
            Text(
              LocaleKeys.no_account.tr(),
              style: AppTextStyleFactory.create(
                size: 13,
                weight: FontWeight.w400,
                color: AppColors.lightHeadingText,
              ),
            ).center,
            verticalSpace(AppSizes.h16),
            AppElevatedButton(
              onPressed: () {
                context.push(Routes.register);
              },
              text: LocaleKeys.create_new_account.tr(),
              textColor: AppColors.deepViolet,
              backgroundColor: const Color(0xff3A2A85).withValues(alpha: 0.3),
            ),
          ],
        ),
      ),
    );
  }
}
