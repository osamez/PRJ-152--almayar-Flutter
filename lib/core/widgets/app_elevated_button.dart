import 'package:almeyar/core/utils/exports.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textStyle,
    this.padding,
    this.radius,
    this.width,
    this.isLoading = false,
    this.height,
    this.isGradient = false,
    this.borderColor,
    this.textColor,
    this.hoverColor,
    this.iconPath,
    this.isDisabled = false,
  });
  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final double? width;
  final double? height;
  final bool isGradient;
  final Color? borderColor;
  final bool isLoading;
  final Color? textColor;
  final Color? hoverColor;
  final String? iconPath;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: SizedBox(
        width: width?.w ?? context.width,
        height: height ?? 48.h,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(
              Size(width?.w ?? context.width, height ?? 48.h),
            ),
            backgroundColor: WidgetStatePropertyAll(
              backgroundColor ?? AppColors.orange,
            ),
            // overlayColor: WidgetStateProperty.resolveWith<Color>((
            //   Set<WidgetState> states,
            // ) {
            //   if (states.contains(WidgetState.hovered)) {
            //     return hoverColor ?? AppColors.primaryDark1;
            //   }
            //   if (states.contains(WidgetState.pressed)) {
            //     return hoverColor ?? AppColors.primaryDark1;
            //   }
            //   return Colors.transparent;
            // }),
            padding: WidgetStateProperty.all(
              padding ?? EdgeInsets.symmetric(horizontal: AppSizes.w12),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  radius ?? AppSizes.radiusSm,
                ),
                side: borderColor != null
                    ? BorderSide(
                        color: borderColor ?? Colors.transparent,
                        width: 1,
                      )
                    : BorderSide.none,
              ),
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iconPath != null) ...[
                  SvgPicture.asset(
                    iconPath!,
                    width: 16.w,
                    height: 16.h,
                    colorFilter: ColorFilter.mode(
                      textColor ?? AppColors.offWhite,
                      BlendMode.srcIn,
                    ),
                  ),

                  horizontalSpace(AppSizes.w8),
                ],

                Text(
                  text,
                  style:
                      textStyle ??
                      AppTextStyleFactory.create(
                        size: 15,
                        weight: FontWeight.w700,
                        color: textColor ?? AppColors.offWhite,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
