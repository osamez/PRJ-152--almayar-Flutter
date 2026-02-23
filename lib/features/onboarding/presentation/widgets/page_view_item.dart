part of '../feature_imports.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.data});
  final OnBoardingModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppAssets.imagesLogoWhite,
          width: AppSizes.w251,
          height: AppSizes.h125,
        ),
        verticalSpace(AppSizes.h100),
        Text(
          data.title.tr(),
          style: AppTextStyleFactory.create(
            size: 24,
            weight: FontWeight.bold,
            color: AppColors.offWhite,
          ),
        ),
        verticalSpace(AppSizes.h30),
        Text(
          data.subTitle.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyleFactory.create(
            size: 19,
            weight: FontWeight.w400,
            color: AppColors.offWhite,
          ),
        ),
      ],
    );
  }
}
