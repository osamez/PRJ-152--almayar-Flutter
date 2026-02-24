import 'package:almeyar/features/home/presentation/feature_imports.dart';

class HomeBannerTwoImage extends StatelessWidget {
  const HomeBannerTwoImage({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.imagesHomeBanner2,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          right: AppSizes.w24,
          left: AppSizes.w24,
          bottom: AppSizes.h20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.tr(),
                style: AppTextStyleFactory.create(
                  size: 16,
                  weight: FontWeight.w700,
                  color: AppColors.offWhite,
                ),
              ),
              verticalSpace(AppSizes.h4),
              Text(
                subtitle.tr(),
                style: AppTextStyleFactory.create(
                  size: 12,
                  weight: FontWeight.w400,
                  color: AppColors.offWhite,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
