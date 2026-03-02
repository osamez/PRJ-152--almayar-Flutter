part of '../../feature_imports.dart';

class PurchaseOrdersSearchBar extends StatelessWidget {
  const PurchaseOrdersSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: LocaleKeys.purchase_orders_search_hint.tr(),
      suffixIcon: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w12,
          vertical: AppSizes.h12,
        ),
        child: SvgPicture.asset(
          AppAssets.svgSearch,
          width: AppSizes.w20,
          height: AppSizes.h20,
          colorFilter: const ColorFilter.mode(
            AppColors.deepViolet,
            BlendMode.srcIn,
          ),
        ),
      ),
      validator: (value) {
        return null;
      },
    );
  }
}
