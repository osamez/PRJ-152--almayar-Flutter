import 'package:almeyar/features/home/presentation/feature_imports.dart';

class MoneyTransfers extends StatelessWidget {
  const MoneyTransfers({
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
          AppAssets.imagesMoneyTransfers,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: AppSizes.h20,
          right: AppSizes.w18,
          left: AppSizes.w18,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 44.w,
                      height: 44.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.w10,
                        vertical: AppSizes.h10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.offWhite,
                        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                      ),
                      child: SvgPicture.asset(
                        AppAssets.svgSwap,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    verticalSpace(AppSizes.h8),
                    Text(
                      title.tr(),
                      style: AppTextStyleFactory.create(
                        size: 16,
                        weight: FontWeight.w700,
                        color: AppColors.offWhite,
                      ),
                    ),
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
              Container(
                width: 36.w,
                height: 36.h,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.w10,
                  vertical: AppSizes.h10,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.offWhite,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: AppColors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
