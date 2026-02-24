import 'package:almeyar/features/home/presentation/feature_imports.dart';

class PayServiceCard extends StatelessWidget {
  const PayServiceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.svgIcon,
    required this.titleColor,
    required this.subtitleColor,
    required this.iconBackgroundColor,
    required this.arrowBackgroundColor,
    required this.arrowColor,
    required this.onTap,
    required this.backgroundColor,
    this.isLeftRadius = false,
    this.isGradient = false,
    this.gradientColor,
  });
  final String title;
  final String subtitle;
  final String svgIcon;
  final Color titleColor;
  final Color subtitleColor;
  final Color iconBackgroundColor;
  final Color arrowBackgroundColor;
  final Color arrowColor;
  final VoidCallback onTap;
  final Color backgroundColor;
  final bool isLeftRadius;
  final bool isGradient;
  final Color? gradientColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h20,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: isGradient
            ? LinearGradient(
                colors: [gradientColor ?? backgroundColor, backgroundColor],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: const Color(0xffC0C0C0).withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 2.77),
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: isLeftRadius
              ? Radius.circular(AppSizes.radiusLg)
              : Radius.zero,
          bottomRight: isLeftRadius
              ? Radius.zero
              : Radius.circular(AppSizes.radiusLg),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 44.w,
            height: 44.h,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w10,
              vertical: AppSizes.h10,
            ),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: SvgPicture.asset(svgIcon, width: 24.w, height: 24.h),
          ),
          verticalSpace(AppSizes.h12),
          Text(
            title.tr(),
            style: AppTextStyleFactory.create(
              size: 16,
              weight: FontWeight.w700,
              color: titleColor,
            ),
          ),
          verticalSpace(AppSizes.h8),
          Text(
            subtitle.tr(),
            style: AppTextStyleFactory.create(
              size: 12,
              weight: FontWeight.w400,
              color: subtitleColor,
            ),
          ),
          verticalSpace(AppSizes.h10),
          Container(
            width: 36.w,
            height: 36.h,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w10,
              vertical: AppSizes.h10,
            ),
            decoration: BoxDecoration(
              color: arrowBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_forward, size: 16, color: arrowColor),
          ),
        ],
      ),
    );
  }
}
