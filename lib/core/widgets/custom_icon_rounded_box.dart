import 'package:almeyar/core/utils/exports.dart';

class CustomIconRoundedBox extends StatelessWidget {
  const CustomIconRoundedBox({
    super.key,
    required this.iconPath,
    this.width,
    this.height,
    this.backgroundColor,
  });
  final String iconPath;
  final double? width;
  final double? height;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? AppSizes.w52,
      height: height ?? AppSizes.h52,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w10,
        vertical: AppSizes.h10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.offWhite,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      ),
      child: SvgPicture.asset(
        iconPath,
        width: AppSizes.w32,
        height: AppSizes.h32,
      ),
    );
  }
}
