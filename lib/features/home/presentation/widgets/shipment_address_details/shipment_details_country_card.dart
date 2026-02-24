part of '../../feature_imports.dart';

class ShipmentDetailsCountryCard extends StatelessWidget {
  const ShipmentDetailsCountryCard({
    super.key,
    required this.arabicName,
    required this.englishName,
    required this.flagAsset,
  });

  final String arabicName;
  final String englishName;
  final String flagAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w16,
        vertical: AppSizes.h16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffF3F3F3),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: AppSizes.w48,
            height: AppSizes.h48,
            padding: EdgeInsets.all(AppSizes.w8),
            decoration: const BoxDecoration(
              color: AppColors.offWhite,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              flagAsset,
              width: AppSizes.w32,
              height: AppSizes.h32,
            ),
          ),
          verticalSpace(AppSizes.h8),
          Text(
            arabicName,
            style: AppTextStyleFactory.create(
              size: 16,
              weight: FontWeight.w700,
              color: AppColors.darkSlate,
            ),
          ),
          verticalSpace(AppSizes.h4),
          Text(
            englishName,
            style: AppTextStyleFactory.create(
              size: 12,
              weight: FontWeight.w400,
              color: AppColors.grey42,
            ),
          ),
        ],
      ),
    );
  }
}
