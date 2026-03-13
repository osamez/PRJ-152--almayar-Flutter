import 'package:almeyar/core/utils/exports.dart';
import 'package:lottie/lottie.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.message,
    this.imagePath,
    this.showScaffold,
    this.onPressed,
  });
  final String message;
  final String? imagePath;
  final VoidCallback? onPressed;
  final bool? showScaffold;
  @override
  Widget build(BuildContext context) {
    return showScaffold == true
        ? Scaffold(
            appBar: const CustomAppBar(title: ''),
            body: _body(),
          )
        : _body();
  }

  Column _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          imagePath ?? AppAssets.animationsError,
          height: 0.3.sh,
          fit: BoxFit.fill,
        ),
        Text(
          "أوه لا، لقد حدث خطأ ما!",
          textAlign: TextAlign.center,
          style: AppTextStyleFactory.create(
            size: 18.sp,
            weight: FontWeight.w600,
          ),
        ),
        verticalSpace(AppSizes.h10),
        Text(
          message,
          textAlign: TextAlign.center,
          style: AppTextStyleFactory.create(
            size: 16,
            weight: FontWeight.w500,
            color: AppColors.hintColor,
          ),
        ),

        if (onPressed != null) ...[
          verticalSpace(AppSizes.h30),
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh, color: AppColors.white),
            label: const Text("إعادة المحاولة"),

            style: ElevatedButton.styleFrom(
              minimumSize: Size(0.8.sw, 50.h),
              textStyle: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w500,
                color: AppColors.white,
              ),
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              backgroundColor: AppColors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
