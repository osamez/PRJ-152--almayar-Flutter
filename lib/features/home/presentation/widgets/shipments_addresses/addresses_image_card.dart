part of '../../feature_imports.dart';

class AddressesImageCard extends StatelessWidget {
  const AddressesImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(end: AppSizes.w20),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
      child: Row(
        spacing: AppSizes.w20,
        children: [
          Flexible(
            child: Image.asset(
              AppAssets.imagesOnboardingBg,
              width: AppSizes.w180,
              height: AppSizes.h148,
              fit: BoxFit.cover,
            ).clipRRect(topLeft: 75, bottomLeft: 75),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.shipments_addresses_heading.tr(),
                  style: AppTextStyleFactory.create(
                    size: 23,
                    weight: FontWeight.w700,
                    color: AppColors.deepViolet,
                  ),
                ),
                verticalSpace(AppSizes.h4),
                Text(
                  LocaleKeys.shipments_addresses_card_desc.tr(),
                  style: AppTextStyleFactory.create(
                    size: 8,
                    weight: FontWeight.w700,
                    color: AppColors.grey42,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
