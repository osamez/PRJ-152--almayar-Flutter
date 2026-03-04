part of '../../feature_imports.dart';

class WalletsHeader extends StatelessWidget {
  const WalletsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomRounderArrow(
          arrowBackgroundColor: AppColors.deepViolet,
          arrowColor: AppColors.white,
        ),
        Text(
          LocaleKeys.wallets_title.tr(),
          style: AppTextStyleFactory.create(
            size: AppSizes.h20,
            weight: FontWeight.w700,
            color: AppColors.deepViolet,
          ),
        ),
      ],
    );
  }
}
