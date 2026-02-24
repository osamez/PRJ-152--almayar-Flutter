import 'package:almeyar/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInkWellWidget extends StatelessWidget {
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final VoidCallback onTap;
  final Color? highlightColor;
  const CustomInkWellWidget({
    super.key,
    this.radius,
    required this.child,
    required this.onTap,
    this.highlightColor,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Future.delayed(const Duration(milliseconds: 100), () => onTap());
        },
        borderRadius: BorderRadius.circular(radius ?? 0.0),
        highlightColor:
            highlightColor ?? AppColors.orange.withValues(alpha: 0.1),
        hoverColor: AppColors.orange.withValues(alpha: 0.1),
        child: Padding(padding: padding!, child: child),
      ),
    );
  }
}
