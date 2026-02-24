import 'package:almeyar/features/home/presentation/feature_imports.dart';

class HomeVerticalCard extends StatelessWidget {
  const HomeVerticalCard({
    super.key,
    required this.title,
    required this.svgIcon,
  });
  final String title;
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w20,
        vertical: AppSizes.h12,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffC0C0C0).withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 2.77),
          ),
        ],
      ),
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
              color: AppColors.grey97,
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: SvgPicture.asset(
              svgIcon,
              width: AppSizes.w24,
              height: AppSizes.h24,
            ),
          ),
          verticalSpace(AppSizes.h8),
          Text(
            title.tr(),
            style: AppTextStyleFactory.create(
              size: 18,
              weight: FontWeight.w700,
              color: AppColors.grey19,
            ),
          ),
        ],
      ),
    );
  }
}
