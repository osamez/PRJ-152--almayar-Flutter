part of '../../feature_imports.dart';

class CustomRounderArrow extends StatelessWidget {
  const CustomRounderArrow({
    super.key,
    required this.arrowBackgroundColor,
    this.width,
    this.height,
    required this.arrowColor,
  });

  final Color arrowBackgroundColor;
  final double? width;
  final double? height;
  final Color arrowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? AppSizes.w36,
      height: height ?? AppSizes.h36,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w10,
        vertical: AppSizes.h10,
      ),
      decoration: BoxDecoration(
        color: arrowBackgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.arrow_forward, size: 16, color: arrowColor),
    );
  }
}
