import 'package:almeyar/features/home/presentation/feature_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.message,
    required this.imagePath,
  });
  final String message;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(imagePath, height: 0.4.sh, fit: BoxFit.fill),
        Text(
          message,
          textAlign: TextAlign.center,
          style: AppTextStyleFactory.create(
            size: 18.sp,
            weight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
