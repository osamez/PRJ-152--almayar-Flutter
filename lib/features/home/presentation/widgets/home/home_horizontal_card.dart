import 'package:almeyar/features/home/presentation/feature_imports.dart';

class HomeHorizontalCard extends StatelessWidget {
  const HomeHorizontalCard({
    super.key,
    required this.color1,
    required this.color2,
    required this.title,
    required this.subtitle,
    required this.svgIcon,
    this.iconBackgroundColor,
    this.titleColor,
    this.subtitleColor,
    this.onTap,
    this.arrowBackgroundColor,
    this.showShadow = false,
  });
  final Color color1;
  final Color color2;
  final String title;
  final String subtitle;
  final String svgIcon;
  final Color? iconBackgroundColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final VoidCallback? onTap;
  final Color? arrowBackgroundColor;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w24,
          vertical: AppSizes.h10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: const Color(0xffC0C0C0).withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 2.77),
                  ),
                ]
              : null,
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: AppSizes.w42,
                    height: AppSizes.h42,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.w10,
                      vertical: AppSizes.h10,
                    ),
                    decoration: BoxDecoration(
                      color: iconBackgroundColor ?? AppColors.white,
                      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                    ),
                    child: SvgPicture.asset(svgIcon),
                  ),
                  verticalSpace(AppSizes.h8),
                  Text(
                    title.tr(),
                    style: AppTextStyleFactory.create(
                      size: 16,
                      weight: FontWeight.w700,
                      color: titleColor ?? AppColors.white,
                    ),
                  ),
                  verticalSpace(AppSizes.h4),
                  Text(
                    subtitle.tr(),
                    style: AppTextStyleFactory.create(
                      size: 12,
                      weight: FontWeight.w400,
                      color: subtitleColor ?? AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: AppSizes.w42,
              height: AppSizes.h42,
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w10,
                vertical: AppSizes.h10,
              ),
              decoration: BoxDecoration(
                color: arrowBackgroundColor ?? AppColors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward,
                size: 16,
                color: AppColors.blue34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
