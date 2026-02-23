part of '../feature_imports.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? activeWidth;
  final Color? activeColor;
  final Color? inactiveColor;

  const DotIndicator({
    super.key,
    this.isActive = false,
    this.onTap,
    this.width,
    this.height,
    this.activeWidth,
    this.inactiveColor,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isActive ? activeWidth ?? AppSizes.w27 : width ?? AppSizes.w27,
        height: AppSizes.h6,
        margin: EdgeInsetsDirectional.only(end: AppSizes.w8),
        decoration: BoxDecoration(
          color: isActive
              ? activeColor ?? AppColors.orange
              : inactiveColor ?? AppColors.offWhite,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}
