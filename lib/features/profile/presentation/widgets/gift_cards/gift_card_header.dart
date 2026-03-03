part of '../../feature_imports.dart';

class GiftCardHeader extends StatelessWidget {
  const GiftCardHeader({super.key, required this.title, required this.isValid});

  final String title;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomIconRoundedBox(
              iconPath: AppAssets.svgGift,
              width: AppSizes.w44,
              height: AppSizes.h44,
              backgroundColor: AppColors.orange,
              iconColor: AppColors.white,
              radius: AppSizes.radiusSm,
              iconWidth: AppSizes.w24,
              iconHeight: AppSizes.h24,
            ),
            verticalSpace(AppSizes.h8),
            Text(
              title,
              style: AppTextStyleFactory.create(
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.darkText,
              ),
            ),
          ],
        ),

        StatusBadge(
          label: isValid
              ? LocaleKeys.gift_cards_status_valid.tr()
              : LocaleKeys.gift_cards_status_expired.tr(),
          color: isValid ? AppColors.green : AppColors.orange,
        ),
      ],
    );
  }
}
