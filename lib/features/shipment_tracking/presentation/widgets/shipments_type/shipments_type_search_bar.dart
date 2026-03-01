part of '../../feature_imports.dart';

class ShipmentsTypeSearchBar extends StatelessWidget {
  const ShipmentsTypeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: LocaleKeys.shipment_tracking_search_hint.tr(),
      suffixIcon: SvgPicture.asset(
        AppAssets.svgBarcode2,
      ).withPadding(vertical: AppSizes.w12, horizontal: AppSizes.w12),
      validator: (value) {
        return null;
      },
    );
  }
}
