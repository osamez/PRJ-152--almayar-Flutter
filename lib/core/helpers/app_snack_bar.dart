import 'package:almeyar/core/utils/exports.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';

enum SnackbarType { success, error }

void showAppSnackbar({
  required BuildContext context,
  required SnackbarType type,
  required String description,
}) {
  switch (type) {
    case SnackbarType.success:
      CherryToast.success(
        toastDuration: const Duration(milliseconds: 2500),
        height: 70,
        toastPosition: Position.bottom,
        textDirection: Directionality.of(context),
        shadowColor: Colors.white,
        animationType: AnimationType.fromBottom,
        displayCloseButton: false,
        backgroundColor: Colors.green.withAlpha(40),
        description: Text(
          description,
          style: AppTextStyleFactory.create(
            size: 12,
            weight: FontWeight.w400,
            color: AppColors.black,
          ),
          //  AppTextStyles.reg12.copyWith(color: AppColors.black),
        ),
        title: Text(
          "تم بنجاح",
          style: AppTextStyleFactory.create(
            size: 12,
            weight: FontWeight.w700,
            color: Colors.green,
          ),
          //  AppTextStyles.bold12.copyWith(color: Colors.green),
        ),
      ).show(context);
      break;
    case SnackbarType.error:
      CherryToast.error(
        toastDuration: const Duration(milliseconds: 2500),
        height: 70,
        toastPosition: Position.bottom,
        textDirection: Directionality.of(context),
        shadowColor: Colors.white,
        animationType: AnimationType.fromBottom,
        displayCloseButton: false,
        backgroundColor: Colors.red.withAlpha(40),
        description: Text(
          description,
          style: const TextStyle(color: AppColors.black),
        ),
        title: Text(
          "حدث خطأ ما",
          style: AppTextStyleFactory.create(
            size: 12,
            weight: FontWeight.w700,
            color: Colors.red,
          ),
          //AppTextStyles.bold12.copyWith(color: Colors.red),
        ),
      ).show(context);
      break;
  }
}
