import 'package:almeyar/features/home/presentation/feature_imports.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        Image.asset(
          AppAssets.imagesHomeBanner,
          height: 0.35.sh,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: topPadding + AppSizes.h20,
          right: AppSizes.w24,
          left: AppSizes.w24,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.w8,
                    vertical: AppSizes.h10,
                  ),
                  height: AppSizes.h46,
                  decoration: BoxDecoration(
                    color: const Color(0xff000000).withValues(alpha: 0.24),
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.home_search_hint.tr(),
                          style: AppTextStyleFactory.create(
                            size: 14,
                            weight: FontWeight.w300,
                            color: AppColors.white,
                          ),
                        ),
                        const Icon(
                          Icons.search,
                          size: 20,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
