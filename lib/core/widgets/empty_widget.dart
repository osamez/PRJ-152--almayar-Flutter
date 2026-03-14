import 'package:almeyar/core/theme/app_text_style_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.message,
    required this.imagePath,
    this.isSvg = false,
  });
  final String message;
  final String imagePath;
  final bool isSvg;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!isSvg)
          LottieBuilder.asset(imagePath, height: 0.4.sh, fit: BoxFit.fill),
        if (isSvg)
          SvgPicture.asset(imagePath, height: 0.35.sh, fit: BoxFit.fill),
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
