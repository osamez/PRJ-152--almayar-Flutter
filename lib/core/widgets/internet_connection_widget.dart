import 'package:almeyar/core/utils/exports.dart';
import 'package:lottie/lottie.dart';

class InternetConnectionWidget extends StatelessWidget {
  const InternetConnectionWidget({
    super.key,
    this.isScaffold = false,
    this.appBar,
    this.onPressed,
  });
  final bool isScaffold;
  final CustomAppBar? appBar;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return isScaffold
        ? Scaffold(appBar: appBar, body: _buildWidget())
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              AppAssets.animationsInternetConnection,
              height: 0.35.sh,
            ),
            verticalSpace(AppSizes.h20),
            Text(
              "لا يوجد اتصال بالشبكة",
              style: AppTextStyleFactory.create(
                size: 24.sp,
                weight: FontWeight.w700,
              ),
            ),
            verticalSpace(AppSizes.h10),
            Text(
              "تحقق من اتصالك بالإنترنت",
              textAlign: TextAlign.center,
              style: AppTextStyleFactory.create(
                size: 16.sp,
                weight: FontWeight.w500,
                color: AppColors.hintColor,
              ),
            ),
            if (onPressed != null) ...[
              verticalSpace(AppSizes.h20),
              AppElevatedButton(
                width: 0.8.sw,
                radius: 20,
                text: 'إعادة المحاولة',
                onPressed: onPressed ?? () {},
                backgroundColor: AppColors.orange,
                textStyle: AppTextStyleFactory.create(
                  size: 16.sp,
                  weight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ],
          ],
        ).withPadding(horizontal: 16, vertical: 24),
      ),
    );
  }
}
