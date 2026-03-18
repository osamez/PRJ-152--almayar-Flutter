part of '../../feature_imports.dart';

class DeliveryRequestsSearchBar extends StatelessWidget {
  const DeliveryRequestsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: LocaleKeys.delivery_requests_search_hint.tr(),
      onChanged: (value) =>
          context.read<DeliveryRequestsCubit>().onSearchChanged(value),
      suffixIcon: SvgPicture.asset(
        AppAssets.svgBarcode2,
      ).withPadding(vertical: AppSizes.w12, horizontal: AppSizes.w12),
      validator: (value) {
        return null;
      },
    );
  }
}
