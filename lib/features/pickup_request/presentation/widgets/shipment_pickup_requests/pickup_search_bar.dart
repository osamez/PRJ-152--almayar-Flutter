part of '../../feature_imports.dart';

class PickupSearchBar extends StatelessWidget {
  const PickupSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: LocaleKeys.pickup_requests_search_hint.tr(),
      suffixIcon: SvgPicture.asset(
        AppAssets.svgBarcode2,
      ).withPadding(vertical: AppSizes.w12, horizontal: AppSizes.w12),
      validator: (value) {
        return null;
      },
    );
  }
}
