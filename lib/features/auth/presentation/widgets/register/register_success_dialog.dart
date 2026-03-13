part of '../../feature_imports.dart';

class RegisterSuccessDialog extends StatelessWidget {
  const RegisterSuccessDialog({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(AppSizes.h24),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              AppAssets.animationsSuccess,
              height: AppSizes.h150,
              repeat: false,
            ),
            verticalSpace(AppSizes.h16),
            Text(
              LocaleKeys.registration_success_title.tr(),
              style: AppTextStyleFactory.create(
                size: 20,
                weight: FontWeight.w700,
                color: AppColors.darkSlate,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(AppSizes.h12),
            Text(
              message,
              style: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w400,
                color: AppColors.grey42,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(AppSizes.h24),
            SizedBox(
              width: double.infinity,
              child: AppElevatedButton(
                onPressed: () {
                  context.pop();
                  context.go(Routes.login);
                },
                text: LocaleKeys.go_to_login.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
