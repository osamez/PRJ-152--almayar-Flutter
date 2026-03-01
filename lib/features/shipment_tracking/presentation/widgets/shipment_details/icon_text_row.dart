part of '../../feature_imports.dart';

class IconTextRow extends StatelessWidget {
  const IconTextRow({
    super.key,
    required this.iconPath,
    required this.text,
    this.iconWidth,
    this.iconHeight,
    this.iconColor,
    this.textSize,
    this.textWeight,
    this.textColor,
    this.spacing,
  });

  final String iconPath;
  final String text;
  final double? iconWidth;
  final double? iconHeight;
  final Color? iconColor;
  final double? textSize;
  final FontWeight? textWeight;
  final Color? textColor;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          iconPath,
          width: iconWidth ?? AppSizes.w16,
          height: iconHeight ?? AppSizes.h16,
          colorFilter: ColorFilter.mode(
            iconColor ?? AppColors.hintColor,
            BlendMode.srcIn,
          ),
        ),
        horizontalSpace(spacing ?? AppSizes.w4),
        Flexible(
          child: Text(
            text,
            style: AppTextStyleFactory.create(
              size: textSize ?? 10,
              weight: textWeight ?? FontWeight.w500,
              color: textColor ?? AppColors.hintColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
